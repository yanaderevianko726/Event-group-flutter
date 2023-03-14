import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/approved_event_model.dart';
import 'package:popuppros/models/invite_event_model.dart';
import '../../models/model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class HomeEventsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  List<EventModel> hostingEvents = [];
  List<ApprovedEventModel> approvedEvents = [];
  List<InviteEventModel> invitedEvents = [];

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadHostingEvents();
    await loadApprovedEvents();
    await loadInvitedEvents();
    onApprovedListener();
    onInviteListener();
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
        .child(Constants.exploreEventsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        if (hostingEvents.length < 5) {
          Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
          Map<String, dynamic> eventMap = <String, dynamic>{};
          objectMap1.forEach((key1, value1) {
            eventMap['$key1'] = value1;
          });
          hostingEvents.add(EventModel.fromJson(eventMap));
        }
      });
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

  loadInvitedEvents() async {
    invitedEvents = [];
    final snapshot = await dbRef
        .child(Constants.invitedEventsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        if (invitedEvents.length < 5) {
          Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
          Map<String, dynamic> eventMap = <String, dynamic>{};
          objectMap1.forEach((key1, value1) {
            eventMap['$key1'] = value1;
          });
          invitedEvents.add(InviteEventModel.fromJson(eventMap));
        }
      });
    }
    update();
  }

  onApprovedListener() {
    dbRef
        .child(Constants.approvedEventsRef)
        .child('${userDetail.userId}')
        .onValue
        .listen((event) async {
      loadApprovedEvents();
    });
  }

  onInviteListener() {
    dbRef
        .child(Constants.invitedEventsRef)
        .child('${userDetail.userId}')
        .onValue
        .listen((event) async {
      loadInvitedEvents();
    });
  }
}
