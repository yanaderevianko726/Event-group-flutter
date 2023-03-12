import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/routes/app_routes.dart';
import 'package:popuppros/utils/constants.dart';
import '../../controllers/welcome_controller.dart';
import '../../utils/constant_widgets.dart';
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
                          width: MediaQuery.of(context).size.width * 0.5,
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
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: getButton(
                  context,
                  accentColor,
                  "SIGN IN",
                  Colors.white,
                  () {
                    Get.toNamed(AppRoutes.signInRoute);
                  },
                  22.sp,
                  weight: FontWeight.w700,
                  buttonHeight: 60.h,
                  borderRadius: BorderRadius.circular(15),
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
