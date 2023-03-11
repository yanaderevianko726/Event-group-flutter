import 'dart:async';
import 'dart:developer' as log;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:popuppros/utils/my_colors.dart';

class MapController extends GetxController {
  Rx<LatLng> liveLocation = const LatLng(49.263889, 28.299722).obs;

  GoogleMapController? mapController;
  Marker? marker;
  Rx<Circle> circles = const Circle(circleId: CircleId("circle")).obs;
  Location location = Location();

  Completer<GoogleMapController> completer = Completer();
  BitmapDescriptor? markerBitmap;
  StreamSubscription? locationSubscription;

  Rx<CameraPosition> kGooglePlex = const CameraPosition(
    target: LatLng(21.2361115, 72.8248267),
    zoom: 0.0,
  ).obs;

  MapType currentMapType = MapType.normal;
  Rx<Color> bgColor = bgDarkWhite.obs;
  Rx<GlobalKey> globalKey = GlobalKey().obs;
  RxDouble currentSliderValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    upDateMarkerAndCircle();
  }

  @override
  void dispose() {
    if (locationSubscription != null) {
      locationSubscription!.cancel();
    }
    super.dispose();
  }

  upDateMarkerAndCircle() {
    marker = Marker(
      markerId: const MarkerId("markerId"),
      position: liveLocation.value,
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: const Offset(0.5, 0.5),
      icon: BitmapDescriptor.defaultMarker,
    );
    circles.value = Circle(
      circleId: const CircleId("circle1"),
      radius: 5,
      zIndex: 1,
      center: liveLocation.value,
      fillColor: pinkColor.withOpacity(0.5),
      strokeColor: pinkColor,
      consumeTapEvents: true,
      strokeWidth: 1,
    );
  }

  void getCurrentLocation() async {
    geo.LocationPermission permission = await geo.Geolocator.checkPermission();

    if (permission == geo.LocationPermission.denied ||
        permission == geo.LocationPermission.deniedForever) {
      if (kDebugMode) {
        print("Location permission not given");
      }
    } else {
      var position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.best,
      );
      log.log("late ${position.latitude}");
      log.log("lang ${position.longitude}");
      liveLocation.value = LatLng(position.latitude, position.longitude);
      kGooglePlex.value = CameraPosition(target: liveLocation.value, zoom: 0.0);
    }
  }
}

class MapLocation {
  final String? placeName;
  final LatLng? latLng;

  MapLocation({this.placeName, this.latLng});
}
