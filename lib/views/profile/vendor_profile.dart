import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';

import '../../controllers/user/vendor_profile_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class VendorProfilePage extends StatefulWidget {
  const VendorProfilePage({Key? key}) : super(key: key);

  @override
  State<VendorProfilePage> createState() => _VendorProfilePageState();
}

class _VendorProfilePageState extends State<VendorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorProfileController>(
      init: VendorProfileController(),
      builder: (vendorProfileController) => GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  topAppBar(
                    title: 'Vendor Profile',
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
                    ],
                    showBack: true,
                  ),
                  ConstantWidget.getVerSpace(48.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ConstantWidget.getTextWidget(
                                  "Vendor Name",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Image.asset(
                                    '${Constants.assetsImagePath}img_info.png',
                                    width: 20.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )
                              ],
                            ),
                            ConstantWidget.getVerSpace(12.h),
                            ConstantWidget.getDefaultTextFiledWithLabel(
                              context,
                              "Vendor name",
                              vendorProfileController.vendorNameCtrl,
                              isEnable: false,
                            ),
                            ConstantWidget.getVerSpace(32.h),
                            Row(
                              children: [
                                ConstantWidget.getTextWidget(
                                  "Vendor Type",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Image.asset(
                                    '${Constants.assetsImagePath}img_info.png',
                                    width: 20.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )
                              ],
                            ),
                            ConstantWidget.getVerSpace(12.h),
                            dropdownMenu(
                              items: Constants.typeList,
                              selectedValue:
                                  vendorProfileController.selectedType,
                              buttonPadding: 4,
                              onChanged: (val) {
                                vendorProfileController.setVendorType(val, () {
                                  setState(() {});
                                });
                              },
                            ),
                            ConstantWidget.getVerSpace(32.h),
                            Row(
                              children: [
                                ConstantWidget.getTextWidget(
                                  "Product or Services",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Image.asset(
                                    '${Constants.assetsImagePath}img_info.png',
                                    width: 20.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )
                              ],
                            ),
                            ConstantWidget.getVerSpace(12.h),
                            ConstantWidget.getDescTextFiledWithLabel(
                              context,
                              "Briefly describe what you service.",
                              vendorProfileController.vendorServiceCtrl,
                              isEnable: false,
                              height: 50.h,
                              minLines: true,
                              maxLine: 5,
                            ),
                            ConstantWidget.getVerSpace(32.h),
                            Row(
                              children: [
                                ConstantWidget.getTextWidget(
                                  "Vendor Image",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Image.asset(
                                    '${Constants.assetsImagePath}img_info.png',
                                    width: 20.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )
                              ],
                            ),
                            ConstantWidget.getVerSpace(12.h),
                            vendorProfileController.imageFile != null ? InkWell(
                              onTap: () {
                                selectTakePhotoMethod(
                                  context,
                                  vendorProfileController,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  File(vendorProfileController
                                      .imageFile!.path),
                                  width: double.infinity,
                                  height: 240.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ) : vendorProfileController.vendorModel.image!.isNotEmpty ? InkWell(
                              onTap: () {
                                selectTakePhotoMethod(
                                  context,
                                  vendorProfileController,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  '${vendorProfileController.vendorModel.image}',
                                  width: double.infinity,
                                  height: 240.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ) : InkWell(
                              onTap: () {
                                selectTakePhotoMethod(
                                  context,
                                  vendorProfileController,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 240.h,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  color: borderColor.withOpacity(0.8),
                                ),
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 48.h,
                                  color: textColor,
                                ),
                              ),
                            ),
                            ConstantWidget.getVerSpace(32.h),
                            Row(
                              children: [
                                ConstantWidget.getTextWidget(
                                  "Location",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Image.asset(
                                    '${Constants.assetsImagePath}img_info.png',
                                    width: 20.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )
                              ],
                            ),
                            ConstantWidget.getVerSpace(12.h),
                            ConstantWidget.getDefaultTextFiledWithLabel(
                              context,
                              "location here.",
                              vendorProfileController.locationController,
                              isEnable: false,
                            ),
                            ConstantWidget.getVerSpace(56.h),
                            getButton(
                              context,
                              primaryColor,
                              "Save Edit",
                              Colors.white,
                              () async {
                                bool isNetwork = await Functions.getNetwork();
                                if (isNetwork) {
                                  vendorProfileController.onClickContinue();
                                } else {
                                  Functions.showToast(
                                      "Please turn on Internet");
                                }
                              },
                              20.sp,
                              weight: FontWeight.w700,
                              buttonHeight: 58.h,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            ConstantWidget.getVerSpace(16.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectTakePhotoMethod(
    context,
    VendorProfileController vendorProfileController,
  ) async {
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
                      'Pop Up Pros',
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
                  "Please select method.",
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
                      "From Camera",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                        await vendorProfileController.addPhoto(1);
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
                      "From Gallery",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                        await vendorProfileController.addPhoto(2);
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
