import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart' as geo;

class WelcomeController extends GetxController {
  bool isSignIn = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getPermissions();
  }

  getPermissions() async {
    geo.LocationPermission permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied ||
        permission == geo.LocationPermission.deniedForever) {
      await geo.Geolocator.requestPermission();
    }
  }
}

