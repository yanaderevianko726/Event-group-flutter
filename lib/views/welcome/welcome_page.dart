import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/routes/app_routes.dart';
import 'package:popuppros/utils/constants.dart';
import '../../controllers/welcome_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double congratsWidth = screenWidth * 0.9;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100.h),
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: congratsWidth,
                      child: Center(
                        child: Image.asset(
                          '${Constants.assetsImagePath}logo.png',
                          width: MediaQuery.of(context).size.width * 0.38,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1),
                      width: congratsWidth,
                      height: congratsWidth,
                      child: Image.asset(
                        '${Constants.assetsImagePath}congrates.png',
                        width: congratsWidth,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: InkWell(
                  onTap: () async {
                    bool isNetwork = await Functions.getNetwork();
                    if (isNetwork) {
                      Get.toNamed(AppRoutes.signInRoute);
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
              ),
              SizedBox(
                height: 88.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstantWidget.getTextWidget('Don\'t have an account?',
                      Colors.black, TextAlign.center, FontWeight.w500, 20.sp),
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
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: bgDarkWhite,
    );
  }
}
