import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/message_channel_model.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class HostingEventViewController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  EventModel eventModel = EventModel();

  List<MessageChannelModel> channels = [];

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadEventModel();
    await loadMessageChannels();
    await addChannelListener();
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

  loadEventModel() async {
    if (Get.arguments != null) {
      eventModel = Get.arguments[0] as EventModel;
      update();
    }
  }

  loadMessageChannels() async {
    final snapshot = await dbRef
        .child(Constants.messageChannelsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      Map<Object?, Object?> objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) async {
        Map<Object?, Object?> channelObject = value as Map<Object?, Object?>;
        Map<String, dynamic> channelMap = <String, dynamic>{};
        channelObject.forEach((key1, value1) {
          channelMap['$key1'] = value1;
        });

        MessageChannelModel channelModel =
        MessageChannelModel.fromJson(channelMap);
        if (channelModel.channelId!.contains('${eventModel.eventId}')){
          if (channelModel.channelId!.contains('${userDetail.userId}')){
            final chkIndex = channels.indexWhere((element) => element.otherId == channelModel.otherId!);
            if(chkIndex == -1){
              channels.add(channelModel);
            }
          }
        }
      });
      update();
    }
  }

  addChannelListener() async {
    dbRef
        .child(Constants.messageChannelsRef)
        .child('${userDetail.userId}')
        .onValue
        .listen((event) async {
      loadMessageChannels();
    });
  }
}
