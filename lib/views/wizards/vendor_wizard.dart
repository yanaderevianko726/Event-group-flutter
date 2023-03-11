// ignore_for_file: library_private_types_in_public_api
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:popuppros/utils/constants.dart';

import '../../controllers/google_map_controller.dart';
import '../../controllers/vendors/vendor_wizard_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class VendorWizard extends StatefulWidget {
  const VendorWizard({super.key});

  @override
  _VendorWizard createState() {
    return _VendorWizard();
  }
}

class _VendorWizard extends State<VendorWizard> {
  MapController mapController = Get.put(MapController());
  VendorWizardController vController = Get.put(VendorWizardController());

  final List<String> vendorTypes = [
    'Food Tent',
    'Food Truck',
    'Entertainer',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<VendorWizardController>(
      init: VendorWizardController(),
      builder: (vendorWzController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: bgDark,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstantWidget.getVerSpace(22.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
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
                              "Vendor Wizard",
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
                        height: 8.h,
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
                              width: screenWidth * 0.6,
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ConstantWidget.getVerSpace(32.h),
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
                                  vendorWzController.vendorNameCtrl,
                                  isEnable: false,
                                  withPrefix: false,
                                  validator: (name) {
                                    if (name == null || name.isEmpty) {
                                      return 'Please enter vendor name.';
                                    } else {
                                      return '';
                                    }
                                  },
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
                                  items: vendorTypes,
                                  selectedValue:
                                      vendorWzController.selectedType,
                                  buttonWidth: screenWidth * 0.88,
                                  onChanged: (val) {
                                    vendorWzController.setVendorType(val, () {
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
                                  vendorWzController.vendorServiceCtrl,
                                  isEnable: false,
                                  height: 50.h,
                                  validator: (services) {
                                    if (services == null || services.isEmpty) {
                                      return 'Please enter your services';
                                    }
                                    return null;
                                  },
                                  minLines: true,
                                  maxLine: 5,
                                ),
                                ConstantWidget.getVerSpace(32.h),
                                Row(
                                  children: [
                                    ConstantWidget.getTextWidget(
                                      "Select Image",
                                      textColor,
                                      TextAlign.center,
                                      FontWeight.w500,
                                      20.sp,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 4.0),
                                      child: Image.asset(
                                        '${Constants.assetsImagePath}img_info.png',
                                        width: 20.h,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )
                                  ],
                                ),
                                ConstantWidget.getVerSpace(12.h),
                                if (vendorWzController.imageFile != null)
                                  InkWell(
                                    onTap: () {
                                      selectTakePhotoMethod(
                                        context,
                                        vendorWzController,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(
                                        File(vendorWzController
                                            .imageFile!.path),
                                        width: double.infinity,
                                        height: 200.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                if (vendorWzController.imageFile == null)
                                  InkWell(
                                    onTap: () {
                                      selectTakePhotoMethod(
                                        context,
                                        vendorWzController,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 200.h,
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
                                  '',
                                  vendorWzController.locationController,
                                  isEnable: false,
                                  withPrefix: false,
                                  validator: (location) {
                                    if (location == null || location.isEmpty) {
                                      return 'Please enter your current location.';
                                    } else {
                                      return '';
                                    }
                                  },
                                ),
                                ConstantWidget.getVerSpace(32.h),
                                Row(
                                  children: [
                                    ConstantWidget.getTextWidget(
                                      "Event Match Radius",
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
                                googleMapContainer(context, vendorWzController),
                                ConstantWidget.getVerSpace(36.h),
                                getButton(
                                  context,
                                  primaryColor,
                                  "Continue",
                                  Colors.white,
                                  () async {
                                    bool isNetwork =
                                        await Functions.getNetwork();
                                    if (isNetwork) {
                                      vendorWzController.onClickContinue();
                                    } else {
                                      Functions.showToast(
                                          "Please turn on Internet");
                                    }
                                  },
                                  20.sp,
                                  weight: FontWeight.w700,
                                  buttonHeight: 58.h,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: vendorWzController.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: primaryLightColor,
                            backgroundColor: const Color(0x0F000000),
                          ),
                        )
                      : Container(),
                ),
              ],
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

  // this is your widgets for map
  // I got it, let me try
  googleMapContainer(
    BuildContext context,
    VendorWizardController vendorWzController,
  ) {
    return GetBuilder<MapController>(
      init: MapController(),
      builder: (mController) => Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Slider(
                  value: mController.currentSliderValue.value,
                  max: 5000,
                  divisions: 10,
                  activeColor: primaryColor,
                  inactiveColor: subTextColor,
                  label: '${mController.currentSliderValue.value}',
                  onChanged: (double value) async {
                    if (kDebugMode) {
                      print('Camera changed $value');
                    }
                    vendorWzController.setRadius(
                      value.toInt(),
                      () {
                        setState(() {
                          mController.currentSliderValue.value = value;
                          mController.mapController?.animateCamera(
                            CameraUpdate.newCameraPosition(CameraPosition(
                              target: mController.liveLocation.value,
                              zoom: 100 / (value * 0.015),
                            )),
                          );
                        });
                      },
                    );
                  },
                  onChangeEnd: (double newValue) {
                    if (kDebugMode) {
                      print('Ended change on $newValue');
                    }
                  },
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: ConstantWidget.getTextWidget(
                  mController.currentSliderValue.toString().split(".")[0],
                  textColor,
                  TextAlign.center,
                  FontWeight.w500,
                  20.sp,
                ),
              ),
            ],
          ),
          googleMapWidget(
            context: context,
            controller: mController,
            onMapCreated: (gmController) {
              mController.mapController = gmController;
            },
          ),
        ],
      ),
    );
  }

  selectTakePhotoMethod(
    context,
    VendorWizardController vendorWizardController,
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
                        await vendorWizardController.addPhoto(1);
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
                        await vendorWizardController.addPhoto(2);
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
