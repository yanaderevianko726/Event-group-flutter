import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/model.dart';
import '../../models/tent_model.dart';
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
    }
    update();
  }

  rejectVendorRequest(
    NotificationModel notificationModel,
    EventModel eventModel,
    VendorModel vendorModel,
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

  acceptVendorRequest(
    NotificationModel notificationModel,
    EventModel eventModel,
    VendorModel vendorModel,
    Function callback,
  ) async {
    isLoading = true;
    update();

    final vStatus =
        '${vendorModel.status}___${Constants.approvedBy}${eventModel.eventId}';
    vendorModel.status = vStatus;

    await dbRef
        .child(Constants.allEventsRef)
        .child('${eventModel.eventId}')
        .set(
          eventModel.toJson(),
        );

    await dbRef
        .child(Constants.hostingEventsRef)
        .child('${eventModel.userId}')
        .child('${eventModel.eventId}')
        .set(
          eventModel.toJson(),
        );

    await dbRef
        .child(Constants.approvedVendorsRef)
        .child('${eventModel.userId}')
        .child('${eventModel.eventId}')
        .child('--${notificationModel.slotIndex}')
        .child('${vendorModel.vendorId}')
        .set(vendorModel.toJson());

    await dbRef
        .child(Constants.approvedEventsRef)
        .child('${notificationModel.senderId}')
        .child('${eventModel.eventId}')
        .child('--${notificationModel.slotIndex}')
        .set(eventModel.toJson());

    await dbRef
        .child(Constants.vendorsRef)
        .child('${vendorModel.vendorId}')
        .set(vendorModel.toJson());

    await dbRef
        .child(Constants.notificationsRef)
        .child('${userDetail.userId}')
        .child('${notificationModel.id}')
        .remove();

    String referredIdsVal = '';
    final snapshot = await dbRef
        .child(Constants.referredVendorsRef)
        .child('${eventModel.eventId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        referredIdsVal = '$value';
      });
      referredIdsVal = '${referredIdsVal}___${vendorModel.vendorId}';
      await dbRef
          .child(Constants.referredVendorsRef)
          .child('${eventModel.eventId}')
          .set({'referredIds': referredIdsVal});
    } else {
      referredIdsVal = '${eventModel.eventId}';
      await dbRef
          .child(Constants.referredVendorsRef)
          .child('${eventModel.eventId}')
          .set({'referredIds': referredIdsVal});
    }

    isLoading = false;
    update();
    callback();
  }
}
