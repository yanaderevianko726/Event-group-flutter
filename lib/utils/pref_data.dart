import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class PrefData {
  static String userDetail = "${Constants.packageName}_userDetail";

  static Future<SharedPreferences> getPrefInstance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static setUserDetail(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userDetail, s);
  }

  static getUserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userDetail) ?? '';
  }
}
