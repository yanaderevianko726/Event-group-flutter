import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:popuppros/models/model.dart';

import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class VendorProfileController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final fireStorageRef = FirebaseStorage.instance.ref();

  UserDetail userDetail = UserDetail();
  VendorModel vendorModel = VendorModel();

  TextEditingController vendorNameCtrl = TextEditingController();
  TextEditingController vendorServiceCtrl = TextEditingController();
  TextEditingController locationController = TextEditingController();

  String? selectedType = 'Food Tent';
  int radius = 0;
  bool isLoading = true;

  XFile? imageFile;
  String? imageUrl;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserDetails();
    await getVendorProfile();
  }

  getUserDetails() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    update();
  }

  getVendorProfile() async {
    isLoading = true;
    update();

    final snapshot = await dbRef.child('${Constants.vendorsRef}/${userDetail.userId}').get();
    if (snapshot.exists) {
      Map<Object?, Object?> maps = snapshot.value as Map<Object?, Object?>;
      Map<String, dynamic> mapJson = <String, dynamic>{};
      maps.forEach((key, value) {
        mapJson['$key'] = '$value';
      });
      vendorModel = VendorModel.fromJson(mapJson);

      vendorNameCtrl.text = vendorModel.vendorName!;
      vendorServiceCtrl.text = vendorModel.serviceDescription!;
      locationController.text = vendorModel.location!;
      if(vendorModel.vendorType!.isNotEmpty){
        selectedType = vendorModel.vendorType!;
      }
    }

    isLoading = false;
    update();
  }

  setVendorType(String val, Function callback) {
    selectedType = val;
    callback();
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

  onClickContinue() async {
    checkEmpty((retVal) async {
      if(retVal){
        vendorModel.vendorId = userDetail.userId;

        if(imageFile == null){
          await PrefData.setVendorDetail(json.encode(vendorModel));
          await dbRef.child(Constants.vendorsRef).child('${userDetail.userId}').set(
              vendorModel.toJson()
          );
          Get.back();
        }else{
          final fileName = imageFile!.name;
          final vendorImageRef = fireStorageRef.child("vendors/$fileName");
          File file = File(imageFile!.path);

          try {
            await vendorImageRef.putFile(file);
            final imgUrl = await vendorImageRef.getDownloadURL();
            vendorModel.image = imgUrl;

            await PrefData.setVendorDetail(json.encode(vendorModel));
            await dbRef.child(Constants.vendorsRef).child('${userDetail.userId}').set(
                vendorModel.toJson()
            );
            Get.back();
          } on FirebaseException {
            isLoading = false;
            update();
            Constants.showToast('Filed to upload image, please try again.');
          }
        }
      }
    });
  }

  checkEmpty(Function callback){
    if(vendorNameCtrl.text.isNotEmpty){
      vendorModel.vendorName = vendorNameCtrl.text;
      if(vendorServiceCtrl.text.isNotEmpty){
        vendorModel.serviceDescription = vendorServiceCtrl.text;
        if (vendorModel.image!.isNotEmpty || imageFile != null){
          if(locationController.text.isNotEmpty){
            vendorModel.location = locationController.text;
            if(radius>=0){
              vendorModel.radius = '$radius';
              callback(true);
            }else{
              Constants.showToast('Fill select radius...');
              callback(false);
            }
          }else{
            Constants.showToast('Fill fill location...');
            callback(false);
          }
        }else{
          callback('Please select image');
        }
      }else{
        Constants.showToast('Fill service description...');
        callback(false);
      }
    }else{
      Constants.showToast('Fill vendor name...');
      callback(false);
    }
  }
}

