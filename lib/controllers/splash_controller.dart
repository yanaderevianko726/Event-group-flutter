import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../utils/pref_data.dart';

class SplashController extends GetxController {
  late User firebaseUser;
  bool isSignIn = false;

  checkLogInStatus(Function callback) async {
    isSignIn = await PrefData.getIsSignIn();
    if(isSignIn){
      String uDetails = await PrefData.getUserDetail();
      if (uDetails.isNotEmpty) {
        callback(true);
      }else{
        callback(false);
      }
    }else{
      callback(false);
    }
  }
}

