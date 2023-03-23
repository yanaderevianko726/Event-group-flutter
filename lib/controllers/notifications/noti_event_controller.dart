import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class NotiEventController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
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

  rejectVendorRequest(
    NotificationModel notificationModel,
    EventModel eventModel,
    Function callback,
  ) async {
    isLoading = true;
    update();

    await dbRef
        .child(Constants.notificationsRef)
        .child('${userDetail.userId}')
        .child('${notificationModel.id}')
        .remove();

    isLoading = false;
    update();
    callback();
  }

  acceptUserRequest(
    NotificationModel notificationModel,
    EventModel eventModel,
    UserDetail userInfo,
    Function callback,
  ) async {
    isLoading = true;
    update();

    if (notificationModel.type == 'Event') {
      var cnt = int.parse(eventModel.interestedIn);
      cnt++;
      eventModel.interestedIn = '$cnt';
      await dbRef
          .child(Constants.allEventsRef)
          .child('${eventModel.eventId}')
          .set(
            eventModel.toJson(),
          );
      await dbRef
          .child(Constants.exploreEventsRef)
          .child('${eventModel.userId}')
          .child('${eventModel.eventId}')
          .set(
            eventModel.toJson(),
          );
      await dbRef
          .child(Constants.approvedUsersRef)
          .child('${eventModel.userId}')
          .child('${eventModel.eventId}')
          .child('${userInfo.userId}')
          .set(
            userInfo.toJson(),
          );
      await dbRef
          .child(Constants.approvedEventsRef)
          .child('${notificationModel.senderId}')
          .child('${eventModel.eventId}')
          .set(
            eventModel.toJson(),
          );
      await dbRef
          .child(Constants.notificationsRef)
          .child('${userDetail.userId}')
          .child('${notificationModel.id}')
          .remove();
      isLoading = false;
      update();
      callback();
    }else{
      isLoading = false;
      update();
      callback();
    }
  }
}
