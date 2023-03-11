import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';

import '../../controllers/vendors/applied_vendor_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class AppliedVendorViewPage extends StatefulWidget {
  const AppliedVendorViewPage({Key? key}) : super(key: key);

  @override
  State<AppliedVendorViewPage> createState() => _AppliedVendorViewPageState();
}

class _AppliedVendorViewPageState extends State<AppliedVendorViewPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgDark,
      body: SafeArea(
        child: GetBuilder<AppliedVendorController>(
          init: AppliedVendorController(),
          builder: (appliedController) => GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (notificationController) => Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: double.infinity,
                  color: bgDarkWhite,
                  child: Column(
                    children: [
                      topAppBar(
                        title: 'Applied Vendor',
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
                                        Get.toNamed(
                                            AppRoutes.notificationRoute);
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
                                        Get.toNamed(
                                            AppRoutes.notificationRoute);
                                      },
                                    ),
                                  ),
                          ),
                        ],
                        showBack: true,
                      ),
                      ConstantWidget.getVerSpace(20.h),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 10.h,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: 12.h,
                              right: 12.h,
                              top: 8.h,
                              bottom: 26.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: subTextColor.withOpacity(0.6),
                                  blurRadius: 8,
                                  offset: const Offset(0, 1),
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: vendorBrowserCell(
                                context: context,
                                vendorModel: appliedController.vendorModel,
                                onClickMessage: (vendor) {
                                  showMessageView(appliedController);
                                }),
                          ),
                        ),
                      ),
                      ConstantWidget.getVerSpace(24.h),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8.h,
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // swipeBottomButton(
                              //   width: 56,
                              //   imgRate: 0.4,
                              //   bgColor: Colors.redAccent,
                              //   image:
                              //       '${Constants.assetsImagePath}ic_reject1.png',
                              //   onClick: () {
                              //     confirmReject(appliedController);
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                      ConstantWidget.getVerSpace(24.h),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: appliedController.isLoading
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
      ),
    );
  }

  showMessageView(AppliedVendorController appliedVendorController) {
    TextEditingController messageTxtController = TextEditingController();
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 240.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
          ),
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: Column(
            children: [
              ConstantWidget.getVerSpace(28.h),
              SizedBox(
                width: double.infinity,
                height: 32.h,
                child: ConstantWidget.getCustomTextWidget(
                  'Pop Up Pros',
                  Colors.black,
                  22.sp,
                  FontWeight.w700,
                  TextAlign.start,
                  1,
                ),
              ),
              ConstantWidget.getVerSpace(24.h),
              Container(
                width: double.infinity,
                height: 48.h,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: getCustomText(
                  "Please write your message to this vendor.",
                  textColor,
                  1,
                  TextAlign.start,
                  FontWeight.w500,
                  18.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: borderColor,
                      ),
                      child: ConstantWidget.getMessageTextFiled(
                        context,
                        "Type a message",
                        messageTxtController,
                        isEnable: false,
                        maxLine: 5,
                        minLines: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (messageTxtController.text.isNotEmpty) {
                        appliedVendorController.onSendMessageToVendor(
                            messageTxtController.text, (val) {
                          Navigator.of(context).pop();
                        });
                      } else {
                        Constants.showToast('Please write message.');
                      }
                    },
                    child: Container(
                      width: 56.h,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: borderColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 14.0,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Image.asset(
                            '${Constants.assetsImagePath}ic_send.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(18.h),
            ],
          ),
        );
      },
    );
  }

  confirmReject(AppliedVendorController appliedController) async {
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
                      'Reject',
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
                  "Do you want to reject this vendor?",
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
                      () {
                        Navigator.of(context).pop();
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
