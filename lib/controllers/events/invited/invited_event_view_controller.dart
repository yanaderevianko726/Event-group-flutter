import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/invite_event_model.dart';
import '../../../models/model.dart';
import '../../../models/tent_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class InvitedEventViewController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  InviteEventModel inviteEventModel = InviteEventModel();
  UserDetail userDetail = UserDetail();
  VendorModel vendorModel = VendorModel();

  List<TentModel> tentModels = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await getVendorProfile();
    loadEventModel();
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

  getVendorProfile() async {
    final snapshot = await dbRef.child('${Constants.vendorsRef}/${userDetail.userId}').get();
    if (snapshot.exists) {
      Map<Object?, Object?> maps = snapshot.value as Map<Object?, Object?>;
      Map<String, dynamic> mapJson = <String, dynamic>{};
      maps.forEach((key, value) {
        mapJson['$key'] = '$value';
      });
      vendorModel = VendorModel.fromJson(mapJson);
    }
    update();
  }

  loadEventModel() {
    if (Get.arguments != null) {
      inviteEventModel = Get.arguments[0] as InviteEventModel;
      tentModels.clear();
      List<dynamic> tentMap =
          jsonDecode(inviteEventModel.tentSlots!) as List<dynamic>;
      for (var element in tentMap) {
        Map<String, dynamic> eleMap = element;
        TentModel tentModel = TentModel.fromJson(eleMap);
        tentModels.add(tentModel);
      }
    }
    update();
  }

  applyInvite(Function callback) async {
    isLoading = true;
    update();

    await dbRef
        .child(Constants.invitedEventsRef)
        .child('${userDetail.userId}')
        .child('${inviteEventModel.eventId}')
        .remove();

    List<TentModel> tentModels = [];
    List<dynamic> tentMap =
        jsonDecode(inviteEventModel.tentSlots!) as List<dynamic>;
    for (var element in tentMap) {
      Map<String, dynamic> eleMap = element;
      TentModel tentModel = TentModel.fromJson(eleMap);
      tentModels.add(tentModel);
    }

    final slotIndex = inviteEventModel.slotIndex ?? '0';
    String cc = tentModels[int.parse(slotIndex)].curTents ?? '0';
    var curCount = int.parse(cc);
    curCount++;
    tentModels[int.parse(slotIndex)].curTents = '$curCount';
    String encodedTentSlots = jsonEncode(tentModels);
    inviteEventModel.tentSlots = encodedTentSlots;

    EventModel eventModel = EventModel.fromJson(inviteEventModel.toJson());

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
        .child(Constants.approvedVendorsRef)
        .child('${eventModel.userId}')
        .child('${eventModel.eventId}')
        .child('--${inviteEventModel.slotIndex}')
        .child('${userDetail.userId}')
        .set(vendorModel.toJson());

    await dbRef
        .child(Constants.approvedEventsRef)
        .child('${userDetail.userId}')
        .child('${eventModel.eventId}')
        .child('--${inviteEventModel.slotIndex}')
        .set(eventModel.toJson());

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
          .set({'referredIds':referredIdsVal});
    }else{
      referredIdsVal = '${eventModel.eventId}';
      await dbRef
          .child(Constants.referredVendorsRef)
          .child('${eventModel.eventId}')
          .set({'referredIds':referredIdsVal});
    }

    isLoading = false;
    update();
    callback(true);
  }
}
