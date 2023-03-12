import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/splash_controller.dart';
import 'package:popuppros/routes/app_routes.dart';
import 'package:popuppros/utils/constants.dart';
import '../utils/functions.dart';
import '../utils/my_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      checkSignIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgDarkWhite,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Image.asset(
              '${Constants.assetsImagePath}logo.png',
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  checkSignIn() async {
    bool isNetwork = await Functions.getNetwork();
    if (isNetwork) {
      await splashController.checkLogInStatus((signInStatus) {
        Get.offAndToNamed(
          signInStatus ? AppRoutes.homeRoute : AppRoutes.welcomeRoute,
        );
      });
    } else {
      Functions.showToast("Please turn on Internet");
      Get.offAndToNamed(AppRoutes.welcomeRoute);
    }
  }
}
