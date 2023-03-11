import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:popuppros/models/model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class ProfileController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserDetail userDetail = UserDetail();
  VendorModel vendorModel = VendorModel();

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserDetails();
    await getVendorProfile();
  }

  getUserDetails() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
      if (kDebugMode) {
        print('userId--->${userDetail.userId}');
      }
    }
    update();
  }

  getVendorProfile() async {
    final snapshot = await dbRef.child('${Constants.vendorsRef}/${userDetail.userId}').get();
    if (snapshot.exists) {
      Map<Object?, Object?> maps = snapshot.value as Map<Object?, Object?>;
      Map<String, dynamic> mapJson = <String, dynamic>{};
      maps.forEach((key, value) {
        mapJson['$key'] = '$value';
      });
      vendorModel = VendorModel.fromJson(mapJson);
    }
    update();
  }

  Future<bool> logOut() async {
    await _googleSignIn.signOut();
    userDetail = UserDetail();
    PrefData.setIsSignIn(false);
    PrefData.setUserDetail("");
    return true;
  }

  Future<void> share() async {
    String share = "PopUpPros \n${Constants.getAppLink()}";
    await FlutterShare.share(
      title: 'share',
      text: share,
    );
  }
}

