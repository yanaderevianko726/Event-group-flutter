import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/message_channel_model.dart';
import 'package:popuppros/models/message_model.dart';
import '../../models/model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class MessagesController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  MessageChannelModel channelModel = MessageChannelModel();
  UserDetail userDetail = UserDetail();
  List<MessageModel> messageModels = [];

  String eventId = '';

  TextEditingController messageTxtController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await getArguments();
    await loadMessages();
    await addMessageChangeListener();
  }

  getUserData() async {
    messageTxtController.text = '';
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    update();
  }

  getArguments() {
    if (Get.arguments != null) {
      eventId = Get.arguments[0] as String;
      channelModel = Get.arguments[1] as MessageChannelModel;
    }
  }

  loadMessages() async {
    messageModels.clear();
    final snapshot = await dbRef
        .child(Constants.messagesRef)
        .child('${channelModel.channelId}')
        .get();
    if(snapshot.exists){
      Map<Object?, Object?> objects = snapshot.value as Map<Object?, Object?>;
      objects.forEach((key, value) {
        Map<Object?, Object?> messageObjects = value as Map<Object?, Object?>;
        Map<String, dynamic> messageMap = <String, dynamic>{};
        messageObjects.forEach((key1, value1) {
          messageMap['$key1'] = value1;
        });
        messageModels.add(MessageModel.fromJson(messageMap));
      });
      if(messageModels.isNotEmpty){
        messageModels.sort((a, b) => a.id!.compareTo(b.id!));
      }
    }
    update();
  }

  onClickSend() async {
    if(messageTxtController.text.isNotEmpty){
      MessageModel messageModel = MessageModel();
      messageModel.channelId = channelModel.channelId;
      messageModel.id = await Constants.currentTimeUTC();
      messageModel.senderId = '${userDetail.userId}';
      messageModel.senderName =
      '${userDetail.firstName} ${userDetail.lastName}';
      messageModel.senderImage = '${userDetail.image}';
      messageModel.isFile = 'Not';
      messageModel.msg = messageTxtController.text;
      await dbRef
          .child(Constants.messagesRef)
          .child('${messageModel.channelId}')
          .child('${messageModel.id}')
          .set(
        messageModel.toJson(),
      );

      messageTxtController.text = '';
      update();
    }else{
      Constants.showToast('Please enter message.');
    }
  }

  addMessageChangeListener() async {
    dbRef
        .child(Constants.messagesRef)
        .child('${channelModel.channelId}')
        .onValue
        .listen((event) async {
      loadMessages();
    });
  }
}
