import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:popuppros/models/vendor_model.dart';

import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';
import '../../views/wizards/event_host_wizard.dart';

class VendorWizardController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final fireStorageRef = FirebaseStorage.instance.ref();

  VendorModel vendorDetail = VendorModel();
  UserDetail userDetail = UserDetail();

  TextEditingController vendorNameCtrl = TextEditingController();
  TextEditingController vendorServiceCtrl = TextEditingController();
  TextEditingController locationController = TextEditingController();

  XFile? imageFile;
  String? imageUrl;

  String? selectedType = 'Food Tent';
  int radius = 0;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserDetails();
    await initVendor();
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

  initVendor() async {
    String vDetails = await PrefData.getVendorDetail();
    if (vDetails.isNotEmpty) {
      Map<String, dynamic> vendorMap;
      vendorMap = jsonDecode(vDetails) as Map<String, dynamic>;
      vendorDetail = VendorModel.fromJson(vendorMap);
    }
    update();
  }

  setVendorType(String val, Function callback) {
    selectedType = val;
    callback();
    update();
  }

  setRadius(int r, Function callback) {
    radius = r;
    callback();
  }

  onClickContinue() async {
    checkEmpty((retVal) async {
      if(retVal){
        isLoading = true;
        update();

        vendorDetail.vendorId = userDetail.userId;
        vendorDetail.vendorType = selectedType;

        final fileName = imageFile!.name;
        final vendorImageRef = fireStorageRef.child("vendors/$fileName");
        File file = File(imageFile!.path);

        try {
          await vendorImageRef.putFile(file);
          final imgUrl = await vendorImageRef.getDownloadURL();
          vendorDetail.image = imgUrl;

          await PrefData.setVendorDetail(json.encode(vendorDetail));
          await dbRef.child(Constants.vendorsRef).child('${userDetail.userId}').set(
              vendorDetail.toJson()
          );

          isLoading = false;
          update();

          Get.to(() => const EventHostWizard());
        } on FirebaseException {
          isLoading = false;
          update();
          Constants.showToast('Filed to upload image, please try again.');
        }
      }else{
        isLoading = false;
        update();
      }
    });
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

  checkEmpty(Function callback){
    if(vendorNameCtrl.text.isNotEmpty){
      vendorDetail.vendorName = vendorNameCtrl.text;
      if(vendorServiceCtrl.text.isNotEmpty){
        vendorDetail.serviceDescription = vendorServiceCtrl.text;
        if (imageFile != null){
          if(locationController.text.isNotEmpty){
            vendorDetail.location = locationController.text;
            if(radius>0){
              vendorDetail.radius = '$radius';
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