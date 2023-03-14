import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class GroupsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  String referredIdsVal = '';
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await getReferredValue();
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

  getReferredValue() async {
    referredIdsVal = '';
    final snapshot = await dbRef
        .child(Constants.referredGroupsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        referredIdsVal = '$value';
      });
      update();
    }
  }
}
