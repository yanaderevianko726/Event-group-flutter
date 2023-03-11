// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/auth/signin_controller.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';
import '../../wizards/usertype_wizard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPage createState() {
    return _SignInPage();
  }
}

class _SignInPage extends State<SignInPage> {
  SignInController sController = Get.put(SignInController());
  final loginForm = GlobalKey<FormState>();

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
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Form(
                    key: loginForm,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 92.h,
                            ),
                            ConstantWidget.getTextWidget(
                              "Welcome back to",
                              primaryColor,
                              TextAlign.center,
                              FontWeight.w600,
                              32.sp,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Image.asset(
                              '${Constants.assetsImagePath}title_splash.png',
                              width: MediaQuery.of(context).size.width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: 148.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child:
                                  ConstantWidget.getDefaultTextFiledWithLabel(
                                context,
                                "Email",
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
                              height: 16.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child:
                                  ConstantWidget.getDefaultTextFiledWithLabel(
                                context,
                                "Password",
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
                            Row(children: [
                              InkWell(
                                child: ConstantWidget.getTextWidget(
                                  'Forgot Password ?',
                                  primaryColor,
                                  TextAlign.end,
                                  FontWeight.w500,
                                  17.sp,
                                ),
                                onTap: () {},
                              ),
                            ]),
                            SizedBox(
                              height: 100.h,
                            ),
                            getButton(
                              context,
                              primaryColor,
                              "Sign In",
                              Colors.white,
                              () async {
                                bool isNetwork = await Functions.getNetwork();
                                if (isNetwork) {
                                  signInController.onClickSignIn((val) {
                                    if (val) {
                                      Get.offAndToNamed(AppRoutes.homeRoute);
                                    }
                                  });
                                } else {
                                  Functions.showToast(
                                    "Please turn on Internet",
                                  );
                                }
                              },
                              20.sp,
                              weight: FontWeight.w700,
                              buttonHeight: 58.h,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                height: 56.h,
                                margin: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
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
                                        child: SvgPicture.asset(
                                          '${Constants.iconsImagePath}google.svg',
                                          height: 22,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      getCustomText(
                                        "SignIn with Google",
                                        textColor,
                                        1,
                                        TextAlign.center,
                                        FontWeight.normal,
                                        20.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () async {
                                checkNetworkForGoogleSignIn(signInController);
                              },
                            ),
                            SizedBox(
                              height: 48.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ConstantWidget.getTextWidget(
                                  'Don\'t you have an account?',
                                  Colors.black,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  17.sp,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.signUpRoute);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12.w),
                                    child: ConstantWidget.getTextWidget(
                                      'SignUp',
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
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
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
          signInController.checkVendorProfile((val){
            if(val){
              Get.offAndToNamed(AppRoutes.homeRoute);
            }else{
              Get.to(() => const UserTypesWizard());
            }
          });
        } else {
          Functions.showToast("Failed to login with google.");
        }
      });
    } else {
      Functions.showToast("Please turn on Internet");
    }
  }
}
