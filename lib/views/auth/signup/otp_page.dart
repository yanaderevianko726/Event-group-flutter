import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../controllers/auth/otp_controller.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';

class OTPPage extends StatefulWidget {
  final String mobile;

  const OTPPage(this.mobile, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPPage createState() {
    return _OTPPage();
  }
}

class _OTPPage extends State<OTPPage> with WidgetsBindingObserver {
  OTPController otpController = Get.put(OTPController());
  Timer? _timer;

  int _countDown = 60;
  String resendString = " ";

  @override
  void initState() {
    super.initState();
    startTimer();
    setNumber();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: requestPop,
      child: Scaffold(
        backgroundColor: bgDarkWhite,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                color: bgDarkWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstantWidget.getVerSpace(20.h),
                    InkWell(
                      onTap: () {
                        requestPop();
                      },
                      child: getSvgImage("arrow_left.svg"),
                    ),
                    ConstantWidget.getVerSpace(56.h),
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: ConstantWidget.getTextWidget(
                                "Verify Code",
                                primaryColor,
                                TextAlign.left,
                                FontWeight.w700,
                                32.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 24.h),
                            child: Center(
                              child: ConstantWidget.getMultilineCustomFont(
                                "Four digits code are sent to (${widget.mobile}). Enter the codes to verify your account.",
                                15.sp,
                                subTextColor,
                                fontWeight: FontWeight.w500,
                                txtHeight: 1.46.h,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          SizedBox(
                            height: 64.h,
                            child: OtpTextField(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              numberOfFields: 6,
                              fieldWidth: 55.h,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              focusedBorderColor: primaryLightColor,
                              borderWidth: 1.h,
                              borderRadius: BorderRadius.circular(12.h),
                              borderColor: subTextColor,
                              showFieldAsBox: true,
                              onCodeChanged: (String code) {},
                              onSubmit: (String smsCode) {
                                otpController.setPinNumber(smsCode);
                              },
                            ),
                          ),
                          ConstantWidget.getVerSpace(48.h),
                          InkWell(
                            onTap: () {
                              if (resendString == 'Resend') {
                                if (_timer != null) {
                                  _timer!.cancel();
                                  startTimer();
                                }
                                setNumber();
                              }
                            },
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ConstantWidget.getRichText(
                                "Don’t receive code? ",
                                "#7D7D7D".toColor(),
                                FontWeight.w500,
                                18.sp,
                                resendString,
                                primaryColor,
                                FontWeight.w700,
                                18.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.h),
                            child: ConstantWidget.getButtonWidget(
                              context,
                              'Verify',
                              primaryColor,
                              () {
                                otpController.signInWithPhoneNumber();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              otpController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryLightColor,
                        backgroundColor: const Color(0x0F000000),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    _countDown = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_countDown < 1) {
        if (mounted) {
          setState(() {
            timer.cancel();
            resendString = 'Resend';
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _countDown = _countDown - 1;
            resendString = 'Resend in ${_countDown.toString()} sec';
          });
        }
      }
    });
  }

  setNumber() async {
    otpController.setPhoneNumber(widget.mobile);
    otpController.verifyPhoneNumber();
  }

  Future<bool> requestPop() {
    Get.back();
    return Future.value(true);
  }
}
