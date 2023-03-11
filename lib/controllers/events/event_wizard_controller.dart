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

class EventWizardController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  EventHostModel hostModel = EventHostModel();

  TextEditingController cityController = TextEditingController();

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initUser();
  }

  initUser() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    update();
  }

  onClickContinue() async {
    if (cityController.text.isNotEmpty) {
      isLoading = true;
      update();
      hostModel.hostId = userDetail.userId;
      hostModel.city = cityController.text;
      await dbRef.child('EventHosts').child('${hostModel.hostId}').set(
            hostModel.toJson(),
          );
      isLoading = false;
      update();
      Get.offAndToNamed(AppRoutes.homeRoute);
    } else {
      Constants.showToast('Please fill the city...');
    }
  }
}
