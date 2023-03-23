// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/auth/signin_controller.dart';
import 'package:popuppros/views/wizards/userdetail_wizard.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../forgetPassword/forget_password1.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPage createState() {
    return _SignInPage();
  }
}

class _SignInPage extends State<SignInPage> {
  SignInController sController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (signInController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: bgDark,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 88.h,
                        ),
                        Image.asset(
                          '${Constants.assetsImagePath}logo.png',
                          width: MediaQuery.of(context).size.width * 0.32,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height: 72.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "abc@email.com",
                            signInController.emailController,
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
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Your password",
                            signInController.passwordController,
                            isEnable: false,
                            isPass: true,
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
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            children: [
                              FlutterSwitch(
                                width: 44.0,
                                height: 22.0,
                                padding: 2.0,
                                toggleSize: 20.0,
                                borderRadius: 15.0,
                                activeColor: primaryColor,
                                value: signInController.isRemember,
                                onToggle: (val) {
                                  setState(() {
                                    signInController.setRemember(val);
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ConstantWidget.getTextWidget(
                                  'Remember Me',
                                  Colors.black54,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  17.sp,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: ConstantWidget.getTextWidget(
                                    'Forgot Password ?',
                                    Colors.black54,
                                    TextAlign.end,
                                    FontWeight.w500,
                                    17.sp,
                                  ),
                                  onTap: () {
                                    Get.to(() => const ForgetPassword1Page());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        InkWell(
                          onTap: () async {
                            bool isNetwork = await Functions.getNetwork();
                            if (isNetwork) {
                              signInController.signinWithEmailPassword((val) {
                                if (val) {
                                  if(signInController.userDetail.title!.isNotEmpty){
                                    Get.offAndToNamed(AppRoutes.homeRoute);
                                  }else{
                                    Get.to(() => const UserDetailWizard());
                                  }
                                }
                              });
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
                                      'SIGN IN',
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
                        SizedBox(
                          height: 16.h,
                        ),
                        ConstantWidget.getTextWidget(
                          'OR',
                          Colors.black38,
                          TextAlign.end,
                          FontWeight.w500,
                          18.sp,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InkWell(
                          onTap: () async {
                            checkNetworkForGoogleSignIn(signInController);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60.h,
                            margin: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: "#0F000000".toColor(),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 16.w),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}ic_google.png',
                                      height: 24,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  getCustomText(
                                    "SignIn with Google",
                                    textColor,
                                    1,
                                    TextAlign.center,
                                    FontWeight.normal,
                                    18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        InkWell(
                          onTap: () async {
                            checkNetworkForGoogleSignIn(signInController);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60.h,
                            margin: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: "#0F000000".toColor(),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 16.w),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}ic_facebook.png',
                                      height: 26,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  getCustomText(
                                    "SignIn with Facebook",
                                    textColor,
                                    1,
                                    TextAlign.center,
                                    FontWeight.normal,
                                    18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstantWidget.getTextWidget(
                              'Don\'t have an account?',
                              Colors.black,
                              TextAlign.center,
                              FontWeight.w500,
                              20.sp,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.signUpRoute);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: ConstantWidget.getTextWidget(
                                  'Sign Up',
                                  primaryColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: signInController.isLoading
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

  checkNetworkForGoogleSignIn(SignInController signInController) async {
    bool isNetwork = await Functions.getNetwork();
    if (isNetwork) {
      await signInController.signInWithGoogle((retVal) {
        if (retVal) {
          if(signInController.userDetail.title!.isNotEmpty){
            Get.offAndToNamed(AppRoutes.homeRoute);
          }else{
            Get.to(() => const UserDetailWizard());
          }
        } else {
          Functions.showToast("Failed to login with google.");
        }
      });
    } else {
      Functions.showToast("Please turn on Internet");
    }
  }
}
