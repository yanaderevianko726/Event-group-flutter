import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../models/userdetail_model.dart';
import '../utils/pref_data.dart';

class HomePageController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  int selectedPage = 0;

  onChange(int value, Function callback) {
    selectedPage = value;
    callback(value);
  }

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserDetails();
  }

  getUserDetails() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
      update();
    }
  }
}
