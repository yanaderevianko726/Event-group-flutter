import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/views/home_page.dart';

import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class OTPController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserDetail userDetail = UserDetail();
  String? verificationId;
  String pinNumber = "";

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
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

  setPhoneNumber(String pn) {
    userDetail.mobile = pn;
    update();
  }

  setPinNumber(String pin) {
    pinNumber = pin;
    signInWithPhoneNumber();
  }

  verifyPhoneNumber() async {
    await _firebaseAuth.verifyPhoneNumber(
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Constants.showToast('The provided phone number is not valid.');
        }
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      codeSent: (String? id, int? resendToken) async {
        verificationId = id;
      },
      phoneNumber: userDetail.mobile,
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    update();
  }

  signInWithPhoneNumber() async {
    if (verificationId != null && verificationId!.isNotEmpty) {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: pinNumber);
      User? user =
          (await _firebaseAuth.signInWithCredential(phoneAuthCredential)).user;
      if (user != null) {
        checkValidation();
      }
    } else {
      Constants.showToast('Fill OTP..');
    }
  }

  checkValidation() async {
    if (Constants.isNotEmpty(pinNumber)) {
      userDetail.phoneVerified = 'Verified';
      await PrefData.setIsSignIn(true);
      await PrefData.setUserDetail(json.encode(userDetail));
      await dbRef.child(Constants.usersRef).child('${userDetail.userId}').set(
            userDetail.toJson(),
          );
      Get.to(() => const HomePage());
    } else {
      Constants.showToast('Fill details...');
    }
  }
}
