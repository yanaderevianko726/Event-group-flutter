import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/invite_event_model.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../models/model.dart';
import '../../models/tent_model.dart';
import '../../utils/constants.dart';
import '../../utils/pref_data.dart';

class BrowseVendorsController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  UserDetail userDetail = UserDetail();
  EventModel eventModel = EventModel();

  List<TentModel> tentModels = [];
  List<String> tentSizes = [];

  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;

  String referVendors = '';
  bool isLoading = false;

  String selectedSize = '';
  int selTentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await getReferVendors();
    await getVendors();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
    }
  }

  getReferVendors() async {
    referVendors = '';
    if (Get.arguments != null) {
      eventModel = Get.arguments[0] as EventModel;

      tentModels = [];
      tentSizes = [];
      List<dynamic> tentMap =
          jsonDecode(eventModel.tentSlots!) as List<dynamic>;
      for (var element in tentMap) {
        Map<String, dynamic> eleMap = element;
        TentModel tentModel = TentModel.fromJson(eleMap);
        tentModels.add(tentModel);
        tentSizes.add(
            '\$ ${tentModel.price} ${tentModel.size1}x${tentModel.size2} ${tentModel.curTents}/${tentModel.totalTents}');
      }
      if (tentSizes.isNotEmpty) {
        setSelectedSize(tentSizes[0], 0);
      }

      final snapshot = await dbRef
          .child(Constants.referredVendorsRef)
          .child('${eventModel.eventId}')
          .get();
      if (snapshot.exists) {
        final objectMap = snapshot.value as Map<Object?, Object?>;
        objectMap.forEach((key, value) {
          referVendors = '$value';
        });
      }
    }
  }

  getVendors() async {
    final snapshot = await dbRef.child(Constants.vendorsRef).get();
    if (snapshot.exists) {
      swipeItems.clear();
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
        Map<String, dynamic> vendorMap = <String, dynamic>{};
        objectMap1.forEach((key, value) {
          vendorMap['$key'] = value;
        });
        if (!referVendors.contains(vendorMap['vendorId'])) {
          if (vendorMap['vendorId'] != userDetail.userId) {
            swipeItems.add(
              SwipeItem(
                content: VendorModel.fromJson(
                  vendorMap,
                ),
                likeAction: () {},
                nopeAction: () {},
                superlikeAction: () {},
              ),
            );
          }
        }
      });
    }
    matchEngine = MatchEngine(swipeItems: swipeItems);
    update();
  }

  setSelectedSize(String selVal, int index) {
    selectedSize = selVal;
    selTentIndex = index;
    update();
  }

  inviteVendor(Function callback) async {
    isLoading = true;
    update();

    VendorModel vendorModel = matchEngine!.currentItem!.content as VendorModel;
    referVendors = '';
    referVendors = '${referVendors}___${vendorModel.vendorId}';
    await dbRef
        .child(Constants.referredVendorsRef)
        .child('${eventModel.eventId}')
        .set({'referredIds': referVendors});

    InviteEventModel inviteEventModel = InviteEventModel();
    inviteEventModel = InviteEventModel.fromJson(eventModel.toJson());
    inviteEventModel.slotIndex = '$selTentIndex';

    await dbRef
        .child(Constants.invitedEventsRef)
        .child('${vendorModel.vendorId}')
        .child('${inviteEventModel.eventId}')
        .set(
          inviteEventModel.toJson(),
        );

    isLoading = false;
    update();
    callback();
  }
}
