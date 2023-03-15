import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_colors.dart';

class ForgetPassword2Page extends StatefulWidget {
  const ForgetPassword2Page({Key? key}) : super(key: key);

  @override
  State<ForgetPassword2Page> createState() => _ForgetPassword2PagePageState();
}

class _ForgetPassword2PagePageState extends State<ForgetPassword2Page> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 26.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_sharp,
                            size: 26,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8.h,
                      ),
                      ConstantWidget.getTextWidget(
                        'Reset Password',
                        Colors.black87,
                        TextAlign.end,
                        FontWeight.w500,
                        28.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: ConstantWidget.getDefaultTextFiledWithLabel(
                      context,
                      "New Password",
                      passwordController,
                      isEnable: false,
                      withPrefix: true,
                      image: "eye.svg",
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter password';
                        } else {
                          return '';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: ConstantWidget.getDefaultTextFiledWithLabel(
                      context,
                      "Confirm Password",
                      confirmController,
                      isEnable: false,
                      withPrefix: true,
                      image: "eye.svg",
                      validator: (confirm) {
                        if (confirm == null || confirm.isEmpty) {
                          return 'Please confirm password';
                        } else {
                          return '';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 72.h,
                  ),
                  InkWell(
                    onTap: () async {
                      bool isNetwork = await Functions.getNetwork();
                      if (isNetwork) {
                        Get.back();
                        Get.back();
                      } else {
                        Functions.showToast(
                          "Please turn on Internet",
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: accentColor,
                        boxShadow: [
                          BoxShadow(
                            color: "#0F000000".toColor(),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 60.h,
                            child: Center(
                              child: ConstantWidget.getTextWidget(
                                'Send',
                                Colors.white,
                                TextAlign.end,
                                FontWeight.w500,
                                20.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60.h,
                            child: Row(
                              children: [
                                const Spacer(),
                                Image.asset(
                                  '${Constants.assetsImagePath}ic_blue_right.png',
                                  height: 26,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(width: 12,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: isLoading
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
    );
  }
}
