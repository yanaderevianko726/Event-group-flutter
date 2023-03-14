import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart' as geo;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:popuppros/utils/constants.dart';
import '../../models/model.dart';
import '../../utils/functions.dart';
import '../../utils/pref_data.dart';

class CreateEventController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final fireStorageRef = FirebaseStorage.instance.ref();

  UserDetail userDetail = UserDetail();
  EventModel eventModel = EventModel();

  TextEditingController venueNameController = TextEditingController();
  TextEditingController venueAddressController = TextEditingController();
  TextEditingController venueDescriptionController = TextEditingController();

  XFile? imageFile;
  String? imageUrl;

  bool isLoading = false;

  geo.Position? currPosition;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await getCurrentLocation();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);

      eventModel.userId = userDetail.userId;
      eventModel.username = '${userDetail.firstName} ${userDetail.lastName}';
      eventModel.userImage = userDetail.image;
    }
    update();
  }

  getCurrentLocation() async {
    geo.LocationPermission permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied ||
        permission == geo.LocationPermission.deniedForever) {
      await geo.Geolocator.requestPermission().then((value) async {
        currPosition = await geo.Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.best,
        );
        eventModel.lat = '${currPosition!.latitude}';
        eventModel.lang = '${currPosition!.longitude}';
        update();
      });
    } else {
      currPosition = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.best,
      );
      eventModel.lat = '${currPosition!.latitude}';
      eventModel.lang = '${currPosition!.longitude}';
    }
  }

  setTimes(int type, DateTime selTime) {
    eventModel.createdAt =
    '${selTime.hour.toString().padLeft(2, '0')} : ${selTime.minute.toString().padLeft(2, '0')}';
    update();
  }

  addPhoto(int type) async {
    final tmpFile = await getImage(type);
    imageFile = tmpFile;
    update();
  }

  Future getImage(int type) async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: type == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    return pickedImage;
  }

  uploadEventModel(Function callback) async {
    checkEmpty((retVal) async {
      if (retVal == '') {
        isLoading = true;
        update();

        eventModel.eventName = venueNameController.text;
        eventModel.location = venueAddressController.text;
        eventModel.description = venueDescriptionController.text;

        if (currPosition != null) {
          eventModel.lat = '${currPosition!.latitude}';
          eventModel.lang = '${currPosition!.longitude}';
        }

        final fileName = imageFile!.name;
        final eventImageRef = fireStorageRef.child("events/$fileName");
        File file = File(imageFile!.path);

        try {
          await eventImageRef.putFile(file);
          final imgUrl = await eventImageRef.getDownloadURL();
          eventModel.eventImage = imgUrl;

          String? newKey = dbRef.child(Constants.exploreEventsRef).push().key;
          eventModel.eventId = newKey;
          await dbRef
              .child(Constants.allEventsRef)
              .child('${eventModel.eventId}')
              .set(
            eventModel.toJson(),
          );
          await dbRef
              .child(Constants.exploreEventsRef)
              .child('${userDetail.userId}')
              .child('${eventModel.eventId}')
              .set(
                eventModel.toJson(),
              );
          callback(true);
        } on FirebaseException {
          Functions.showToast('Filed to upload image, please try again.');
          callback(false);
        }
      } else {
        Functions.showToast('$retVal');
        callback(false);
      }
    });
  }

  checkEmpty(Function callback) {
    if (venueNameController.text.isNotEmpty) {
      if (venueAddressController.text.isNotEmpty) {
        if (venueDescriptionController.text.isNotEmpty) {
          if (imageFile != null) {
            callback('');
          } else {
            callback('Please select image');
          }
        } else {
          callback('Please fill description');
        }
      } else {
        callback('Please fill address');
      }
    } else {
      callback('Please fill venue name');
    }
  }
}
