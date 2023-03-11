import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/views/wizards/vendor_wizard.dart';

import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class UserTypeController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  @override
  void onInit() {
    super.onInit();
    initUser();
  }

  initUser() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    update();
  }

  setVendorType() {
    if(userDetail.isVendor == 'Not'){
      userDetail.isVendor = 'Yes';
    }else{
      userDetail.isVendor = 'Not';
    }
    update();
  }

  setHostType() {
    if(userDetail.isHost == 'Not'){
      userDetail.isHost = 'Yes';
    }else{
      userDetail.isHost = 'Not';
    }
    update();
  }

  onClickContinue() async {
    if(userDetail.isVendor == 'Not' && userDetail.isHost == 'Not'){
      Constants.showToast('Select user type at lest one...');
    }else{
      await PrefData.setUserDetail(json.encode(userDetail));
      await dbRef.child(Constants.usersRef).child('${userDetail.userId}').set(
          userDetail.toJson()
      );
      Get.to(() => const VendorWizard());
    }
  }
}