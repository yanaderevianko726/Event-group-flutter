import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/tag_model.dart';
import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/pref_data.dart';

class JoinGroupController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  List<TagModel> tagModels = [];
  List<UserDetail> peoples = [];

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserDetails();
    await loadEventTags();
    await loadPeoples();
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

  loadEventTags() async {
    tagModels = [];
    isLoading = true;
    update();

    // final snapshot = await dbRef.child(Constants.eventTypes).get();
    // if (snapshot.exists) {
    //   final objectMap = snapshot.value as Map<Object?, Object?>;
    //   objectMap.forEach((key, value) {
    //     Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
    //     Map<String, dynamic> eventTypeMap = <String, dynamic>{};
    //     objectMap1.forEach((key1, value1) {
    //       eventTypeMap['$key1'] = value1;
    //     });
    //     eventTypes.add(EventType.fromJson(eventTypeMap));
    //   });
    // }

    final _titles = [
      'Sports',
      'Music',
      'Foods',
      'Arts',
    ];

    final _colors = [
      'FFE5625E',
      'FFE46D44',
      'FFDC42BF',
      'FFEEB868',
    ];

    for (var i = 0; i < _titles.length; i++) {
      TagModel eventType = TagModel(
        title: _titles[i],
        color: _colors[i],
        icon: Constants.eventIcons[i],
      );
      tagModels.add(eventType);
    }

    isLoading = false;
    update();
  }

  loadPeoples() async {
    peoples.clear();
  }
}
