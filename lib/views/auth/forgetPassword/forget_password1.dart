import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/views/auth/forgetPassword/forget_password2.dart';

import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_colors.dart';

class ForgetPassword1Page extends StatefulWidget {
  const ForgetPassword1Page({Key? key}) : super(key: key);

  @override
  State<ForgetPassword1Page> createState() => _ForgetPassword1PageState();
}

class _ForgetPassword1PageState extends State<ForgetPassword1Page> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
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
                    height: statusBarHeight + 24.h,
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
                        'Forget Password',
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
                      "Email",
                      emailController,
                      isEnable: false,
                      withPrefix: true,
                      image: "mail.svg",
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter email';
                        } else {
                          return '';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Center(
                      child: ConstantWidget.getTextWidget(
                        'Please enter email, we will send the link for reset password to this email.',
                        descriptionColor,
                        TextAlign.start,
                        FontWeight.w400,
                        18.sp,
                        maxLines: 2
                      ),
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
                        Get.to(() => const ForgetPassword2Page());
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
