import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/invite_event_model.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class InvitedEventsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadInvitedEvents();
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

  loadInvitedEvents() async {
    swipeItems.clear();
    final snapshot = await dbRef
        .child(Constants.invitedEventsRef)
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
        swipeItems.add(
          SwipeItem(
            content: InviteEventModel.fromJson(
              eventMap,
            ),
            likeAction: () {},
            nopeAction: () {},
            superlikeAction: () {},
          ),
        );
      });
      matchEngine = MatchEngine(swipeItems: swipeItems);
      update();
    }
  }
}
