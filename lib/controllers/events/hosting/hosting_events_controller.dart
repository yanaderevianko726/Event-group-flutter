import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class ExploreEventsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  List<EventModel> exploreEvents = [];

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
    exploreEvents = [];
    final snapshot = await dbRef
        .child(Constants.exploreEventsRef)
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
        exploreEvents.add(EventModel.fromJson(eventMap));
      });
    }
    update();
  }
}
