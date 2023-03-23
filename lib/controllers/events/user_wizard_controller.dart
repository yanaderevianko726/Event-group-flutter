import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../models/event_host_model.dart';
import '../../models/userdetail_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class UserWizardController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  bool isLoading = false;
  TextEditingController titleTC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initUser();
  }

  initUser() async {
    titleTC.text = '';
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    update();
  }

  onClickContinue() async {
    isLoading = true;
    update();

    isLoading = false;
    update();
    Get.offAndToNamed(AppRoutes.homeRoute);
  }
}
