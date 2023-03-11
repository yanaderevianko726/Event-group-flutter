import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/user/profile_controller.dart';
import '../../models/userdetail_model.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';
import '../../utils/pref_data.dart';
import '../../utils/widgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  XFile? _image;
  String? imageUrl;
  int age = 0;
  String? state;
  String gender = "Male";
  String address = "";
  String city = "";
  String country = "";
  final editForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      UserDetail userDetail = await Functions.getUserDetail();
      setState(() {
        age = int.parse(userDetail.age!);
        gender = userDetail.gender!;
        address = userDetail.address!;
        city = userDetail.city!;
        country = userDetail.country!;
        if (userDetail.state == null) {
          state = "";
        } else {
          state = userDetail.state!;
        }

        if (userDetail.image != null) {
          if (userDetail.image!.isNotEmpty) {
            imageUrl = userDetail.image;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: requestPop,
      child: Form(
        key: editForm,
        child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (profileController) {
              return Scaffold(
                backgroundColor: bgDarkWhite,
                bottomNavigationBar: Container(
                  padding: EdgeInsets.only(
                    right: 20.h,
                    bottom: 60.h,
                    left: 20.h,
                  ),
                  child: getButton(
                    context,
                    accentColor,
                    "Save",
                    Colors.white,
                    () {
                      if (editForm.currentState!.validate()) {
                        checkNetwork();
                      }
                    },
                    20.sp,
                    weight: FontWeight.w700,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(22.h),
                  ),
                ),
                body: SafeArea(
                  child: ConstantWidget.getPaddingWidget(
                    EdgeInsets.symmetric(horizontal: 20.h),
                    Column(
                      children: [
                        ConstantWidget.getVerSpace(23.h),
                        buildAppBar(),
                        ConstantWidget.getVerSpace(50.h),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipOval(
                              child: Material(
                                child: getProfileImage(),
                              ),
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () async {
                                  final tmpFile = await getImage(2);
                                  setState(() {
                                    _image = tmpFile;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 8.h,
                                  ),
                                  height: 36.h,
                                  width: 36.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50.h),
                                    boxShadow: [
                                      BoxShadow(
                                        color: containerShadow,
                                        blurRadius: 32,
                                        offset: const Offset(-2, 5),
                                      )
                                    ],
                                  ),
                                  child: getSvgImage("edit.svg"),
                                ),
                              ),
                            )
                          ],
                        ),
                        ConstantWidget.getVerSpace(40.h),
                        ConstantWidget.getDefaultTextFiledWithLabel(
                          context,
                          "Full Name",
                          nameController,
                          isEnable: false,
                          height: 50.h,
                          withPrefix: true,
                          image: "profile.svg",
                          validator: (username) {
                            if (username == null || username.isEmpty) {
                              return "Please enter username.";
                            }
                            return null;
                          },
                        ),
                        ConstantWidget.getVerSpace(20.h),
                        ConstantWidget.getDefaultTextFiledWithLabel(
                          context,
                          "Email",
                          emailController,
                          isEnable: false,
                          height: 50.h,
                          withPrefix: true,
                          image: "mail.svg",
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return "Please enter email";
                            }
                            if (!emailExpress.hasMatch(email)) {
                              return "Please enter valid email.";
                            }
                            return null;
                          },
                        ),
                        ConstantWidget.getVerSpace(20.h),
                        ConstantWidget.getDefaultTextFiledWithLabel(
                          context,
                          "Phone Number",
                          phoneNumberController,
                          isEnable: false,
                          height: 50.h,
                          withPrefix: true,
                          image: "mail.svg",
                          validator: (number) {
                            if (number == null || number.isEmpty) {
                              return "Please enter phone number.";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  RegExp emailExpress = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  Widget buildAppBar() {
    return Row(children: [
      InkWell(
        onTap: () {
          requestPop();
        },
        child: getSvgImage(
          "arrow_left.svg",
          height: 24.h,
          width: 24.h,
        ),
      ),
      ConstantWidget.getHorSpace(12.h),
      getCustomText(
        "Edit Profile",
        textColor,
        1,
        TextAlign.start,
        FontWeight.w700,
        22.sp,
      )
    ]);
  }

  getProfileImage() {
    if (_image != null) {
      return Image.file(
        File(_image!.path),
        width: 100.h,
        height: 100.h,
      );
    } else if (imageUrl != null) {
      return Image.network(imageUrl!, width: 100.h, height: 100.h);
    } else {
      return Image.asset("${Constants.assetsImagePath}profile_imge.png",
          width: 100.h, height: 100.h);
    }
  }

  Future<bool> requestPop() {
    Get.back();
    return Future.value(false);
  }

  Future getImage(int type) async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: type == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    return pickedImage;
  }

  Future<void> checkNetwork() async {
    bool isNetwork = await Functions.getNetwork();
    if (!isNetwork) {
      Functions.showToast('There is no network, please check your internet.');
    }
  }

  logOUt(profileController) async {
    bool isNetwork = await Functions.getNetwork();
    if (isNetwork) {
      profileController.logOut().then((value) {
        Functions.showToast('Log out');
      });
    } else {
      Functions.showToast("Please turn on Internet");
    }
  }
}
