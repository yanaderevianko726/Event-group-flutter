// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/events/event_wizard_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';

class EventHostWizard extends StatefulWidget {
  const EventHostWizard({super.key});

  @override
  _EventHostWizard createState() {
    return _EventHostWizard();
  }
}

class _EventHostWizard extends State<EventHostWizard> {
  EventWizardController eController = Get.put(EventWizardController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<EventWizardController>(
      init: EventWizardController(),
      builder: (eController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: bgDark,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
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
                              "Event Host Wizard",
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
                              width: screenWidth,
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
                      Row(
                        children: [
                          ConstantWidget.getTextWidget(
                            "City",
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
                        "City",
                        eController.cityController,
                        isEnable: false,
                        withPrefix: false,
                        validator: (city) {
                          if (city == null || city.isEmpty) {
                            return 'Please enter city.';
                          } else {
                            return '';
                          }
                        },
                      ),
                      const Spacer(),
                      getButton(
                        context,
                        primaryColor,
                        "Continue",
                        Colors.white,
                        () async {
                          bool isNetwork = await Functions.getNetwork();
                          if (isNetwork) {
                            eController.onClickContinue();
                          } else {
                            Functions.showToast("Please turn on Internet");
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
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: eController.isLoading
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
}
