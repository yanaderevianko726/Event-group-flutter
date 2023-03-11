import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/message_channel_model.dart';
import 'package:popuppros/models/message_model.dart';
import '../../models/model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class AppliedVendorController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  VendorModel vendorModel = VendorModel();
  EventModel eventModel = EventModel();

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    getVendorModel();
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

  getVendorModel() {
    if (Get.arguments != null) {
      vendorModel = Get.arguments[0] as VendorModel;
      eventModel = Get.arguments[1] as EventModel;
    }
    update();
  }

  onSendMessageToVendor(String message, Function callback) async {
    isLoading = true;
    update();

    final snapshot = await dbRef
        .child(Constants.messageChannelsRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      bool channelExist = false;
      String channelId = '';
      Map<Object?, Object?> objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) async {
        Map<Object?, Object?> channelMap = value as Map<Object?, Object?>;
        Map<String, dynamic> modelMap = <String, dynamic>{};
        channelMap.forEach((key1, value1) {
          modelMap['$key1'] = value1;
        });

        MessageChannelModel channelModel =
            MessageChannelModel.fromJson(modelMap);
        if (channelModel.channelId!.contains('${eventModel.eventId}')){
          if (channelModel.channelId!.contains('${vendorModel.vendorId}')){
            if (channelModel.channelId!.contains('${userDetail.userId}')){
              channelExist = true;
              channelId = channelModel.channelId!;
            }
          }
        }
      });

      if (channelExist) {
        MessageModel messageModel = MessageModel();
        messageModel.channelId = channelId;
        messageModel.id = await Constants.currentTimeUTC();
        messageModel.senderId = '${userDetail.userId}';
        messageModel.senderName =
            '${userDetail.firstName} ${userDetail.lastName}';
        messageModel.senderImage = '${userDetail.image}';
        messageModel.isFile = 'Not';
        messageModel.msg = message;
        await dbRef
            .child(Constants.messagesRef)
            .child('${messageModel.channelId}')
            .child('${messageModel.id}')
            .set(
              messageModel.toJson(),
            );

        callback(true);

        isLoading = false;
        update();
      } else {
        createNewChannel((newChannelId) async {
          if (newChannelId != null && newChannelId != '') {
            MessageModel messageModel = MessageModel();
            messageModel.channelId = newChannelId;
            messageModel.id = await Constants.currentTimeUTC();
            messageModel.senderId = '${userDetail.userId}';
            messageModel.senderName =
                '${userDetail.firstName} ${userDetail.lastName}';
            messageModel.senderImage = '${userDetail.image}';
            messageModel.isFile = 'Not';
            messageModel.msg = message;
            await dbRef
                .child(Constants.messagesRef)
                .child('${messageModel.channelId}')
                .child('${messageModel.id}')
                .set(
                  messageModel.toJson(),
                );

            callback(true);

            isLoading = false;
            update();
          }
        });
      }
    } else {
      createNewChannel((newChannelId) async {
        if (newChannelId != null && newChannelId != '') {
          MessageModel messageModel = MessageModel();
          messageModel.channelId = newChannelId;
          messageModel.id = await Constants.currentTimeUTC();
          messageModel.senderId = '${userDetail.userId}';
          messageModel.senderName =
              '${userDetail.firstName} ${userDetail.lastName}';
          messageModel.senderImage = '${userDetail.image}';
          messageModel.isFile = 'Not';
          messageModel.msg = message;
          await dbRef
              .child(Constants.messagesRef)
              .child('${messageModel.channelId}')
              .child('${messageModel.id}')
              .set(
                messageModel.toJson(),
              );

          callback(true);

          isLoading = false;
          update();
        }
      });
    }
  }

  createNewChannel(Function callback) async {
    final channelId = '${eventModel.eventId}__${vendorModel.vendorId}__${userDetail.userId}';
    MessageChannelModel channelModel = MessageChannelModel();
    channelModel.channelId = channelId;
    channelModel.userId = userDetail.userId;
    channelModel.otherId = vendorModel.vendorId;
    channelModel.otherName = '${vendorModel.vendorName}';
    channelModel.otherImage = '${vendorModel.image}';
    channelModel.eventId = '${eventModel.eventId}';
    await dbRef
        .child(Constants.messageChannelsRef)
        .child('${userDetail.userId}')
        .child('${channelModel.channelId}')
        .set(
          channelModel.toJson(),
        );

    MessageChannelModel channelModel1 = MessageChannelModel();
    channelModel1.channelId = channelId;
    channelModel1.userId = vendorModel.vendorId;
    channelModel1.otherId = userDetail.userId;
    channelModel1.otherName = '${userDetail.firstName} ${userDetail.lastName}';
    channelModel1.otherImage = '${userDetail.image}';
    channelModel1.eventId = '${eventModel.eventId}';
    await dbRef
        .child(Constants.messageChannelsRef)
        .child('${vendorModel.vendorId}')
        .child('${channelModel1.channelId}')
        .set(
          channelModel1.toJson(),
        );

    callback(channelId);
  }
}
