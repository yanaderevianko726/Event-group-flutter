// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/signup_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';
import '../../wizards/userdetail_wizard.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  SignUpController sController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (signUpController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: bgDark,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
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
                              'Sign up',
                              Colors.black87,
                              TextAlign.end,
                              FontWeight.w500,
                              28.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 52.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Full name",
                            signUpController.fNameController,
                            isEnable: false,
                            withPrefix: true,
                            image: "User.svg",
                            validator: (fullname) {
                              if (fullname == null || fullname.isEmpty) {
                                return 'Please enter fullname';
                              } else {
                                return '';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Email",
                            signUpController.emailController,
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
                          height: 22.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Password",
                            signUpController.passwordController,
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
                          height: 22.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Confirm password",
                            signUpController.confirmController,
                            isEnable: false,
                            isPass: true,
                            withPrefix: true,
                            image: "eye.svg",
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Please confirm password';
                              } else {
                                return '';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        InkWell(
                          onTap: () async {
                            bool isNetwork = await Functions.getNetwork();
                            if (isNetwork) {
                              signUpWithEmailPassword(signUpController);
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
                                      'SIGN UP',
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
                            checkNetworkForGoogleSignUp(signUpController);
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
                            checkNetworkForGoogleSignUp(signUpController);
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
                          height: 48.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstantWidget.getTextWidget(
                              'Do you have an account? ',
                              Colors.black,
                              TextAlign.center,
                              FontWeight.w500,
                              17.sp,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.signInRoute);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: ConstantWidget.getTextWidget(
                                  'Sign In',
                                  primaryColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: signUpController.isLoading
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

  checkNetworkForGoogleSignUp(SignUpController signUpController) async {
    bool isNetwork = await Functions.getNetwork();
    if (isNetwork) {
      await signUpController.signInWithGoogle((retVal) {
        if (retVal) {
          if(signUpController.userDetail.title!.isNotEmpty){
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

  signUpWithEmailPassword(SignUpController signUpController) {
    Get.offAndToNamed(AppRoutes.homeRoute);
    signUpController.signupWithEmailPassword((retVal) {
      if (retVal >= 5) {
        if(signUpController.userDetail.title!.isNotEmpty){
          Get.offAndToNamed(AppRoutes.homeRoute);
        }else{
          Get.to(() => const UserDetailWizard());
        }
      }
    });
  }
}
