import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class GroupInfoController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  int index = 0;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
      update();
    }
  }
}
