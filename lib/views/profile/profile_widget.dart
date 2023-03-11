// ignore_for_file: library_private_types_in_public_api
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';

import '../../controllers/user/profile_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
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
          color: bgDarkWhite,
          child: Column(
            children: [
              topAppBar(
                title: 'Profile',
                icons: [
                  SizedBox(
                    width: 36.h,
                    height: 36.h,
                    child: notificationController.notificationCount > 0
                        ? Badge(
                            label: Text(
                              '${notificationController.notificationCount}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: InkWell(
                              child: Icon(
                                Icons.notifications_none,
                                size: 36.h,
                                color: primaryLightColor,
                              ),
                              onTap: () {
                                Get.toNamed(AppRoutes.notificationRoute);
                              },
                            ),
                          )
                        : Center(
                            child: InkWell(
                              child: Icon(
                                Icons.notifications_none,
                                size: 36.h,
                                color: primaryLightColor,
                              ),
                              onTap: () {
                                Get.toNamed(AppRoutes.notificationRoute);
                              },
                            ),
                          ),
                  ),
                  topIcon(
                    icon: Icons.search,
                    callback: () {},
                  ),
                ],
              ),
              if (profileController.userDetail != null)
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 20.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: "#0F000000".toColor(),
                        blurRadius: 28,
                        offset: const Offset(0, 6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Material(
                          child: profileController.userDetail.image != ''
                              ? CachedNetworkImage(
                                  height: 80.h,
                                  width: 80.h,
                                  imageUrl: profileController.userDetail.image!,
                                )
                              : Image.asset(
                                  "${Constants.assetsImagePath}profile_imge.png",
                                  width: 80.h,
                                  height: 80.h,
                                ),
                        ),
                      ),
                      ConstantWidget.getHorSpace(16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomText(
                            profileController.userDetail.firstName != null
                                ? '${profileController.userDetail.firstName} ${profileController.userDetail.lastName}'
                                : '',
                            textColor,
                            1,
                            TextAlign.start,
                            FontWeight.w500,
                            19.sp,
                          ),
                          ConstantWidget.getVerSpace(4.h),
                          getCustomText(
                            profileController.userDetail.email != null
                                ? '${profileController.userDetail.email}'
                                : '',
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
              ConstantWidget.getVerSpace(18.h),
              if (profileController.userDetail != null)
                Container(
                  width: screenWidth,
                  height: 56.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 20.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2.h,
                      color: borderColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        '${Constants.assetsImagePath}ic_call.png',
                        width: 28.h,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                      getCustomText(
                        '+380 50 155 2037',
                        textColor,
                        1,
                        TextAlign.start,
                        FontWeight.w500,
                        17.sp,
                      ),
                    ],
                  ),
                ),
              ConstantWidget.getVerSpace(40.h),
              if (profileController.userDetail != null)
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.vendorProfileRoute);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          '${Constants.assetsImagePath}ic_bookmark.png',
                          width: 24.h,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          width: 16.h,
                        ),
                        Expanded(
                          child: getCustomText(
                            'Vendor Profile',
                            textColor,
                            1,
                            TextAlign.start,
                            FontWeight.w500,
                            17.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 24.h,
                          color: textColor,
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                width: screenWidth,
                height: 0.8.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                color: borderColor,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.hostProfileRoute);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        '${Constants.assetsImagePath}ic_bookmark.png',
                        width: 24.h,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                      Expanded(
                        child: getCustomText(
                          'Host Profile',
                          textColor,
                          1,
                          TextAlign.start,
                          FontWeight.w500,
                          17.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 24.h,
                        color: textColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: 0.8.h,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                color: borderColor,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 12.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 5.h,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      '${Constants.assetsImagePath}ic_bookmark.png',
                      width: 24.h,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: getCustomText(
                        'Points',
                        textColor,
                        1,
                        TextAlign.start,
                        FontWeight.w500,
                        17.sp,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 24.h,
                      color: textColor,
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: 0.8.h,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                color: borderColor,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 20.h,
                ),
                child: getButton(
                  context,
                  primaryColor,
                  "Sign Out",
                  Colors.white,
                  () {
                    onSignOut(profileController, context);
                  },
                  20.sp,
                  weight: FontWeight.w700,
                  buttonHeight: 58.h,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(
                height: 32.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  onSignOut(profileController, context) async {
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
