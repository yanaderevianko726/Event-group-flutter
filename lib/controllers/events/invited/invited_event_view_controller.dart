import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/invite_event_model.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class InvitedEventViewController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  InviteEventModel inviteEventModel = InviteEventModel();
  UserDetail userDetail = UserDetail();
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    loadEventModel();
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

  loadEventModel() {
    if (Get.arguments != null) {
      inviteEventModel = Get.arguments[0] as InviteEventModel;
      update();
    }
  }

  applyInvite(Function callback) async {
    isLoading = true;
    update();
    await dbRef
        .child(Constants.invitedEventsRef)
        .child('${userDetail.userId}')
        .child('${inviteEventModel.eventId}')
        .remove();
    isLoading = false;
    update();
    callback(true);
  }
}
