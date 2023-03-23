import 'package:get/get.dart';
import '../utils/pref_data.dart';

class SplashController extends GetxController {

  checkLogInStatus(Function callback) async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      callback(true);
    }else{
      callback(false);
    }
  }
}

