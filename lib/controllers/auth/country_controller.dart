import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  String code = "+1";
  String codeName = "US";

  @override
  void onInit() {
    super.onInit();
    initCode();
  }

  initCode() {
    code = "+1";
    codeName = "US";
  }

  changeCode(CountryCode value) {
    code = value.dialCode.toString();
    codeName = value.code.toString();
    update();
  }
}