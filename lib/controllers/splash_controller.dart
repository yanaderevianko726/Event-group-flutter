import 'package:get/get.dart';
import '../utils/pref_data.dart';

class SplashController extends GetxController {
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

