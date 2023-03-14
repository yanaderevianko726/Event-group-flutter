import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/pref_data.dart';

class JoinGroupController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  bool isLoading = false;

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

      final snapshot = await dbRef.child(Constants.vendorsRef).child('${userDetail.userId}').get();
      if (snapshot.exists) {
        final objectMap = snapshot.value as Map<Object?, Object?>;
        Map<String, dynamic> vendorMap = <String, dynamic>{};
        objectMap.forEach((key, value) {
          vendorMap['$key'] = value;
        });
      }
      update();
    }
  }
}
