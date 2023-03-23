import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/userdetail_model.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/pref_data.dart';

class SignUpController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserDetail userDetail = UserDetail();

  TextEditingController fNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  bool isLoading = false;
  String cUserId = '';

  @override
  void onInit() {
    super.onInit();
    fNameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmController.text = '';
  }

  getUserWithUserId(userId, Function callback) async {
    final snapshot =
    await dbRef.child(Constants.usersRef).child('$userId').get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      Map<String, dynamic> userMap = <String, dynamic>{};
      objectMap.forEach((key, value) {
        userMap['$key'] = value;
      });
      UserDetail userData = UserDetail.fromJson(userMap);
      if (userData.userId != null) {
        userDetail = userData;
        cUserId = userDetail.userId!;
        await PrefData.setUserDetail(json.encode(userDetail));
        callback(true);
      } else {
        callback(false);
      }
    } else {
      callback(false);
    }
  }

  signUpWithEmailAndPassword(emailAddress, password, Function callback) async {
    isLoading = true;
    update();
    var md5Password = generateMd5(password);
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: md5Password,
      );
      if(credential.user != null){
        User? user = credential.user;
        userDetail = UserDetail();
        cUserId = userDetail.userId!;
        userDetail.userId = user!.uid;
        userDetail.firstName = fNameController.text;
        userDetail.email = emailAddress;
        userDetail.password = password;
        userDetail.phoneVerified = "Not";

        await PrefData.setUserDetail(json.encode(userDetail));
        dbRef.child(Constants.usersRef).child('${userDetail.userId}').set(
            userDetail.toJson()
        );
        isLoading = false;
        update();
        callback(true);
      }else{
        isLoading = false;
        update();
        Functions.showToast("This email is not valid, please try with another email.");
        callback(false);
      }
    } on FirebaseAuthException {
      isLoading = false;
      update();
      Functions.showToast("Signup failed, please check your network.");
      callback(false);
    } catch (e) {
      isLoading = false;
      update();
      Functions.showToast("Signup failed, please check your network.");
      callback(false);
    }
  }

  signInWithGoogle(Function callback) async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if(googleSignInAccount != null){
      isLoading = true;
      update();

      GoogleSignInAuthentication googleSignInAuth = await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );
      UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
      User? user = authResult.user;
      if(user != null){
        cUserId = user.uid;
        getUserWithUserId(user.uid, (retVal) async {
          if (retVal) {
            isLoading = false;
            update();
            callback(true);
          } else {
            final name = user.displayName!.split(' ');
            userDetail = UserDetail();
            userDetail.userId = user.uid;
            userDetail.firstName = name[0];
            if(name.length>=2){
              userDetail.lastName = name[1];
            }
            userDetail.email = user.email;
            userDetail.mobile = user.phoneNumber;
            userDetail.image = user.photoURL;
            userDetail.phoneVerified = "Verified";

            await PrefData.setUserDetail(json.encode(userDetail));
            await dbRef.child(Constants.usersRef).child('${userDetail.userId}').set(
                userDetail.toJson()
            );
            isLoading = false;
            update();
            callback(true);
          }
        });
      }else{
        isLoading = false;
        update();
        Functions.showToast("Signup failed, please check your network.");
        callback(false);
      }
    }else{
      callback(false);
    }
  }

  onClickSignup(Function callback) {
    if(fNameController.text.isNotEmpty){
      if(emailController.text.isNotEmpty){
        if(passwordController.text.isNotEmpty){
          if(confirmController.text.length>=6){
            signUpWithEmailAndPassword(emailController.text, passwordController.text, (retVal){
              if(retVal){
                callback(7);
              }else{
                Functions.showToast("Signup failed, please try again.");
                callback(6);
              }
            });
          }else{
            Functions.showToast("Please confirm password.");
            callback(5);
          }
        }else{
          Functions.showToast("Please enter password.");
          callback(4);
        }
      }else{
        Functions.showToast("Please enter email.");
        callback(2);
      }
    }else{
      Functions.showToast("Please enter full name.");
      callback(0);
    }
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}

