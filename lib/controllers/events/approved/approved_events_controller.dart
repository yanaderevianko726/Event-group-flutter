import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/approved_event_model.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class ApprovedEventsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  List<ApprovedEventModel> approvedEvents = [];

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadApprovedEvents();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    update();
  }

  loadApprovedEvents() async {
    approvedEvents = [];

    final snapshot = await dbRef
        .child(Constants.approvedEventsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        if (approvedEvents.length < 5) {
          Map<Object?, Object?> objectsMap = value as Map<Object?, Object?>;
          objectsMap.forEach((key1, value1) {
            final slotIndex = '$key1'.split('--')[1];
            ApprovedEventModel approvedEventModel = ApprovedEventModel(selTentIndex: slotIndex, eventModel: EventModel());
            Map<String, dynamic> eventMap = <String, dynamic>{};
            Map<Object?, Object?> valueMap = value1 as Map<Object?, Object?>;
            valueMap.forEach((key2, value2) {
              eventMap['$key2'] = value2;
            });
            approvedEventModel.eventModel = EventModel.fromJson(eventMap);
            approvedEvents.add(approvedEventModel);
          });
        }
      });
    }
    update();
  }
}
