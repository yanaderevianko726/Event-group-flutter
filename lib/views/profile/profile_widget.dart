// ignore_for_file: library_private_types_in_public_api
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';

import '../../controllers/user/profile_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  _ProfileWidget createState() => _ProfileWidget();
}

class _ProfileWidget extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profileController) => GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) => Container(
          height: double.infinity,
          width: double.infinity,
          color: bgLightWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: purpleDeepDarkColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 64,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_sharp,
                                size: 26,
                                color: purpleDarkColor,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: getCustomText(
                                  'Profile',
                                  purpleDarkColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  24.sp,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.more_horiz,
                                size: 36.h,
                                color: purpleDarkColor,
                              ),
                              onTap: () => {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 12.h,
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Material(
                                child: profileController.userDetail.image != ''
                                    ? CachedNetworkImage(
                                        height: 80.h,
                                        width: 80.h,
                                        imageUrl:
                                            profileController.userDetail.image!,
                                      )
                                    : Image.asset(
                                        "${Constants.assetsImagePath}profile_imge.png",
                                        width: 80.h,
                                        height: 80.h,
                                      ),
                              ),
                            ),
                            ConstantWidget.getHorSpace(20.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomText(
                                  'Chinelo Chyko',
                                  Colors.white.withOpacity(0.9),
                                  1,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                                ConstantWidget.getVerSpace(10.h),
                                getCustomText(
                                  'Product Designer',
                                  descriptionColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  17.sp,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Spacer(),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: purpleColor.withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Center(
                                  child: ConstantWidget.getTextWidget(
                                    '•  Designer',
                                    Colors.lightGreen.withOpacity(0.8),
                                    TextAlign.end,
                                    FontWeight.w400,
                                    18.sp,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 108,
                              height: 30,
                              margin: const EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                color: purpleColor.withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Center(
                                  child: ConstantWidget.getTextWidget(
                                    '•  Developer',
                                    Colors.lightBlueAccent.withOpacity(0.8),
                                    TextAlign.end,
                                    FontWeight.w400,
                                    18.sp,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        margin: const EdgeInsets.only(top: 24),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: purpleLightColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.25,
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConstantWidget.getTextWidget(
                                    '239',
                                    Colors.white,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    24.sp,
                                  ),
                                  ConstantWidget.getTextWidget(
                                    'Total Post',
                                    Colors.white.withOpacity(0.7),
                                    TextAlign.center,
                                    FontWeight.w400,
                                    18.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.25,
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConstantWidget.getTextWidget(
                                    '239',
                                    Colors.white,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    24.sp,
                                  ),
                                  ConstantWidget.getTextWidget(
                                    'Followers',
                                    Colors.white.withOpacity(0.7),
                                    TextAlign.center,
                                    FontWeight.w400,
                                    18.sp,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.25,
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConstantWidget.getTextWidget(
                                    '239',
                                    Colors.white,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    24.sp,
                                  ),
                                  ConstantWidget.getTextWidget(
                                    'Following',
                                    Colors.white.withOpacity(0.7),
                                    TextAlign.center,
                                    FontWeight.w400,
                                    18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(24.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 1,
                        strokeCap: StrokeCap.butt,
                        dashPattern: const [8, 5],
                        borderType: BorderType.Circle,
                        radius: const Radius.circular(8),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/ic_more1.png',
                            width: 24,
                            fit: BoxFit.fitWidth,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/ic_bag.png',
                            width: 24,
                            fit: BoxFit.fitWidth,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/ic_img1.png',
                            width: 24,
                            fit: BoxFit.fitWidth,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(40.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.4,
                        height: screenWidth * 0.4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15),),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/users%2Favatar.png?alt=media&token=7f1beeb1-059c-4bc8-83e9-3994123b6835',
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.4,
                        height: screenWidth * 0.4,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15),),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/users%2Favatar.png?alt=media&token=7f1beeb1-059c-4bc8-83e9-3994123b6835',
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSignOut(profileController) async {
    double btnWidth = (MediaQuery.of(context).size.width - 80) / 2;
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              ConstantWidget.getVerSpace(32.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ConstantWidget.getCustomTextWidget(
                      'Sign Out',
                      Colors.black,
                      22.sp,
                      FontWeight.w700,
                      TextAlign.start,
                      1,
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: getCustomText(
                  "Do you want to sign out?",
                  textColor,
                  1,
                  TextAlign.start,
                  FontWeight.w500,
                  18.sp,
                ),
              ),
              ConstantWidget.getVerSpace(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: btnWidth,
                    child: getButton(
                      context,
                      primaryColor,
                      "Yes",
                      Colors.white,
                      () async {
                        await profileController.logOut().then(
                          (retStatus) {
                            Navigator.of(context).pop();
                            Get.offAndToNamed(AppRoutes.welcomeRoute);
                          },
                        );
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(
                    width: 28.h,
                  ),
                  SizedBox(
                    width: btnWidth,
                    child: getButton(
                      context,
                      primaryColor,
                      "No",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(16.h),
            ],
          ),
        );
      },
    );
  }
}
