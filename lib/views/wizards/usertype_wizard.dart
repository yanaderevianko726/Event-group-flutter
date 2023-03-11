// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/user/usertype_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';

class UserTypesWizard extends StatefulWidget {
  const UserTypesWizard({super.key});

  @override
  _UserTypesPage createState() {
    return _UserTypesPage();
  }
}

class _UserTypesPage extends State<UserTypesWizard> {
  UserTypeController userController = Get.put(UserTypeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<UserTypeController>(
      init: UserTypeController(),
      builder: (uController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: bgDark,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstantWidget.getVerSpace(22.h),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: getSvgImage(
                            "arrow_left.svg",
                            width: 28.h,
                            height: 28.h,
                          ),
                        ),
                        ConstantWidget.getTextWidget(
                          "Select User Types",
                          textColor,
                          TextAlign.center,
                          FontWeight.w400,
                          24.sp,
                        ),
                        SizedBox(
                          width: 28.h,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40.h),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 6.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                            color: borderColor,
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.3,
                          height: 6.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                            color: primaryLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ConstantWidget.getVerSpace(32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ConstantWidget.getTextWidget(
                      "Select User Types",
                      Colors.black87,
                      TextAlign.start,
                      FontWeight.w500,
                      26.sp,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: getButton(
                      context,
                      uController.userDetail.isVendor == 'Not'
                          ? pinkColor
                          : primaryColor,
                      "I am a vendor",
                      uController.userDetail.isVendor == 'Not'
                          ? Colors.black87
                          : Colors.white,
                      () {
                        uController.setVendorType();
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: getButton(
                      context,
                      uController.userDetail.isHost == 'Not'
                          ? pinkColor
                          : primaryColor,
                      "I am a event host",
                      uController.userDetail.isHost == 'Not'
                          ? Colors.black87
                          : Colors.white,
                      () {
                        uController.setHostType();
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: ConstantWidget.getTextWidget(
                            'Select all that apply',
                            primaryColor,
                            TextAlign.end,
                            FontWeight.w500,
                            18.sp,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 32.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: getButton(
                      context,
                      primaryColor,
                      "Continue",
                      Colors.white,
                      () async {
                        bool isNetwork = await Functions.getNetwork();
                        if (isNetwork) {
                          uController.onClickContinue();
                        } else {
                          Functions.showToast("Please turn on Internet");
                        }
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          Get.back();
          return Future.value(false);
        },
      ),
    );
  }
}
