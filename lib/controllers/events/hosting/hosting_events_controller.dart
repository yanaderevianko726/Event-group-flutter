import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class HostingEventsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  List<EventModel> hostingEvents = [];

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadHostingEvents();
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

  loadHostingEvents() async {
    hostingEvents = [];
    final snapshot = await dbRef
        .child(Constants.hostingEventsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
        Map<String, dynamic> eventMap = <String, dynamic>{};
        objectMap1.forEach((key1, value1) {
          eventMap['$key1'] = value1;
        });
        hostingEvents.add(EventModel.fromJson(eventMap));
      });
    }
    update();
  }
}
