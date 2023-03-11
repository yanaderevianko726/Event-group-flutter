import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../models/notification_model.dart';
import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class NotificationController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  List<NotificationModel> notifications = [];

  int notificationCount = 0;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadNotifications();
    onNotificationListener();
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

  loadNotifications() async {
    notifications = [];
    notificationCount = 0;
    final snapshot = await dbRef
        .child(Constants.notificationsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
        Map<String, dynamic> notificationMap = <String, dynamic>{};
        objectMap1.forEach((key1, value1) {
          notificationMap['$key1'] = value1;
        });
        notifications.add(NotificationModel.fromJson(notificationMap));
        if (notificationMap['isRead'] == 'Not') {
          notificationCount += 1;
        }
      });
    }
    update();
  }

  setRead(int index, Function callback) async {
    notifications[index].isRead = 'Read';
    update();

    if(notifications[index].isRead == 'Not'){
      await dbRef
          .child(Constants.notificationsRef)
          .child('${userDetail.userId}')
          .child('${notifications[index].id}')
          .child('isRead')
          .set('Read');
      callback();
    }else{
      callback();
    }
  }

  onNotificationListener() {
    dbRef
        .child(Constants.notificationsRef)
        .child('${userDetail.userId}')
        .onValue
        .listen((event) async {
      loadNotifications();
    });
  }
}
