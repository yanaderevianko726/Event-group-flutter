// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/signup_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';
import '../../wizards/usertype_wizard.dart';
import 'otp_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  SignUpController sController = Get.put(SignUpController());
  final registerForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (signUpController) => WillPopScope(
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
                    key: registerForm,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 72.h,
                            ),
                            ConstantWidget.getTextWidget(
                                "Welcome To ",
                                primaryColor,
                                TextAlign.center,
                                FontWeight.w600,
                                32.sp),
                            SizedBox(
                              height: 8.h,
                            ),
                            Image.asset(
                              '${Constants.assetsImagePath}title_splash.png',
                              width: MediaQuery.of(context).size.width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: 64.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: 58.h,
                              padding: EdgeInsets.all(1.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.4,
                                    height: 56.h,
                                    child: ConstantWidget
                                        .getDefaultTextFiledWithLabel(
                                      context,
                                      "Firstname",
                                      signUpController.fNameController,
                                      isEnable: false,
                                      withPrefix: true,
                                      image: 'User.svg',
                                      validator: (firstname) {
                                        if (firstname == null ||
                                            firstname.isEmpty) {
                                          return 'Please enter firstname';
                                        } else {
                                          return '';
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.4,
                                    height: 56.h,
                                    child: ConstantWidget
                                        .getDefaultTextFiledWithLabel(
                                      context,
                                      "Lsatname",
                                      signUpController.lNameController,
                                      isEnable: false,
                                      withPrefix: true,
                                      image: 'User.svg',
                                      validator: (lastname) {
                                        if (lastname == null ||
                                            lastname.isEmpty) {
                                          return 'Please enter lastname';
                                        } else {
                                          return '';
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child:
                                  ConstantWidget.getDefaultTextFiledWithLabel(
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
                              child: ConstantWidget.getCountryTextFiled(
                                context,
                                "Phone Number",
                                signUpController.phoneController,
                                isEnable: false,
                                height: 50.h,
                                withPrefix: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (number) {
                                  if (number == null || number.isEmpty) {
                                    return "Please enter phone number";
                                  }
                                  return null;
                                },
                                onChanged: (countryCode) {
                                  signUpController.setCountryCode(countryCode);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child:
                                  ConstantWidget.getDefaultTextFiledWithLabel(
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
                            Row(children: [
                              InkWell(
                                child: ConstantWidget.getTextWidget(
                                  '* Minimum 6 characters',
                                  textColor,
                                  TextAlign.end,
                                  FontWeight.w500,
                                  17.sp,
                                ),
                                onTap: () {},
                              ),
                            ]),
                            SizedBox(
                              height: 56.h,
                            ),
                            getButton(
                              context,
                              primaryColor,
                              "Sign Up",
                              Colors.white,
                              () async {
                                bool isNetwork = await Functions.getNetwork();
                                if (isNetwork) {
                                  onClickSignUp(signUpController);
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
                              height: 12.h,
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
                                checkNetworkForGoogleSignUp(signUpController);
                              },
                            ),
                            SizedBox(
                              height: 32.h,
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
                                      'SignIn',
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
          signUpController.checkVendorProfile((val){
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

  onClickSignUp(SignUpController signUpController) {
    signUpController.onClickSignup((retVal) {
      if (retVal >= 7) {
        Get.to(
          () => OTPPage(
            "${signUpController.cCode}${signUpController.phoneController.text}",
          ),
        );
      }
    });
  }
}
