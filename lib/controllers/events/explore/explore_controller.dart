import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/utils/my_colors.dart';
import '../../../models/event_type_model.dart';
import '../../../models/model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class ExploreController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();
  VendorModel vendorModel = VendorModel();

  List<EventType> eventTypes = [];
  int sizeIndex = -1;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadEventTypes();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
    String vDetails = await PrefData.getVendorDetail();
    if (vDetails.isNotEmpty) {
      Map<String, dynamic> vendorMap;
      vendorMap = jsonDecode(vDetails) as Map<String, dynamic>;
      vendorModel = VendorModel.fromJson(vendorMap);
    }
    update();
  }

  loadEventTypes() async {
    eventTypes = [];
    isLoading = true;
    update();

    final _titles = [
      'Sports',
      'Music',
      'Foods',
      'Arts',
    ];

    final _colors = [
      '#FFE5625E',
      '#FFE46D44',
      '#FFDC42BF',
      '#FFEEB868',
    ];

    final _icons = [
      'sports',
      'musics',
      'foods',
      'arts',
    ];

    for(var i=0; i<_titles.length; i++){
      EventType eventType = EventType(
        title: '${_titles[0]}',
        color: '${_colors[0]}',
        icon: '${_icons[0]}',
      );
      eventTypes.add(eventType);
    }
    update();

    // final snapshot = await dbRef.child(Constants.eventTypes).get();
    // if (snapshot.exists) {
    //   final objectMap = snapshot.value as Map<Object?, Object?>;
    //   objectMap.forEach((key, value) {
    //     Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
    //     Map<String, dynamic> eventTypeMap = <String, dynamic>{};
    //     objectMap1.forEach((key1, value1) {
    //       eventTypeMap['$key1'] = value1;
    //     });
    //     eventTypes.add(EventType.fromJson(eventTypeMap));
    //   });
    // }

    isLoading = false;
    update();
  }
}
