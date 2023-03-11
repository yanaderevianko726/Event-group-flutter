import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/tent_model.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class UpComingEventsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  VendorModel vendorModel = VendorModel();

  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  String referredIdsVal = '';

  String? selectedSize = '';
  int sizeIndex = -1;
  bool isLoading = false;
  int eventCount = 0;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await getReferredValue();
    await loadUpcomingEvents();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    String vDetails = await PrefData.getVendorDetail();
    if (vDetails.isNotEmpty) {
      Map<String, dynamic> vendorMap;
      vendorMap = jsonDecode(vDetails) as Map<String, dynamic>;
      vendorModel = VendorModel.fromJson(vendorMap);
    }
    update();
  }

  getReferredValue() async {
    referredIdsVal = '';
    final snapshot = await dbRef
        .child(Constants.referredEventRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        referredIdsVal = '$value';
        if (kDebugMode) {
          print('referredIdsVal--->$referredIdsVal');
        }
      });
    }
    update();
  }

  loadUpcomingEvents() async {
    List<EventModel> upcomingEvents = [];
    swipeItems.clear();

    isLoading = true;
    update();

    final snapshot = await dbRef.child(Constants.allEventsRef).get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      int cnt = 0;
      objectMap.forEach((key, value) {
        if (cnt >= eventCount && upcomingEvents.length < 5) {
          Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
          Map<String, dynamic> eventMap = <String, dynamic>{};
          objectMap1.forEach((key1, value1) {
            eventMap['$key1'] = value1;
          });
          if (eventMap['userId'] != userDetail.userId) {
            final eId = eventMap['eventId'];
            if(!referredIdsVal.contains('$eId')){
              upcomingEvents.add(EventModel.fromJson(eventMap));
            }
          }
        }
        cnt++;
      });
      eventCount = cnt;

      for (int i = 0; i < upcomingEvents.length; i++) {
        swipeItems.add(
          SwipeItem(
            content: upcomingEvents[i],
            likeAction: () {},
            nopeAction: () {},
            superlikeAction: () {},
          ),
        );
      }
    }

    isLoading = false;
    update();

    matchEngine = MatchEngine(swipeItems: swipeItems);
    update();
  }

  setSelectedSize(String selVal, int index) {
    selectedSize = selVal;
    sizeIndex = index;
    update();
  }

  setSizeIndex(int index) {
    sizeIndex = index;
    update();
  }

  applyEvents(
    List<TentModel> tents,
    EventModel eventModel,
    List<String> tentSizes,
    Function callback,
  ) async {
    final slotIndex = tentSizes.indexOf(selectedSize!);
    if (slotIndex != -1) {
      isLoading = true;
      update();

      NotificationModel notificationModel = NotificationModel();
      String? newKey = dbRef
          .child(Constants.notificationsRef)
          .child('${eventModel.userId}')
          .push()
          .key;
      notificationModel.id = newKey;
      notificationModel.title = 'Event apply request';
      notificationModel.content =
          'You received a notification from ${eventModel.firstName} ${eventModel.lastName} to apply to your event ${eventModel.venueName}';
      notificationModel.senderId = '${userDetail.userId}';
      notificationModel.senderName =
          '${userDetail.firstName} ${userDetail.lastName}';
      notificationModel.senderImage = '${userDetail.image}';
      notificationModel.fromType = 'Vendor';
      notificationModel.fromId = '${vendorModel.vendorId}';
      notificationModel.toType = 'Event';
      notificationModel.toId = '${eventModel.eventId}';
      notificationModel.slotIndex = '$slotIndex';

      await dbRef
          .child(Constants.notificationsRef)
          .child('${eventModel.userId}')
          .child('${notificationModel.id}')
          .set(notificationModel.toJson());

      final snapshot = await dbRef
          .child(Constants.referredEventRef)
          .child('${userDetail.userId}')
          .get();
      if (snapshot.exists) {
        final objectMap = snapshot.value as Map<Object?, Object?>;
        String referredVal = '';
        objectMap.forEach((key, value) {
          referredVal = '$value';
        });
        referredIdsVal = '${referredVal}___${eventModel.eventId}';
        await dbRef
            .child(Constants.referredEventRef)
            .child('${userDetail.userId}')
            .set({'referredIds':referredIdsVal});
      }else{
        referredIdsVal = '${eventModel.eventId}';
        await dbRef
            .child(Constants.referredEventRef)
            .child('${userDetail.userId}')
            .set({'referredIds':referredIdsVal});
      }

      isLoading = false;
      update();
      callback(true);
    } else {
      callback(false);
    }
  }
}
