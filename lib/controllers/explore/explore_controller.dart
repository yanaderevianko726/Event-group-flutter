import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../../models/model.dart';
import '../../../models/tag_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/pref_data.dart';

class ExploreController extends GetxController {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  UserDetail userDetail = UserDetail();

  List<TagModel> tagModels = [];
  List<EventModel> eventModels = [];
  List<EventModel> featuredEvents = [];
  bool isLoading = false;

  String referredIdsVal = '';

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  initController() async {
    await getUserData();
    await loadEventTags();
    await getReferredValue();
    await loadEventModels();
  }

  getUserData() async {
    String uDetails = await PrefData.getUserDetail();
    if (uDetails.isNotEmpty) {
      Map<String, dynamic> userMap;
      userMap = jsonDecode(uDetails) as Map<String, dynamic>;
      userDetail = UserDetail.fromJson(userMap);
      update();
    }
  }

  loadEventTags() async {
    tagModels = [];
    isLoading = true;
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

    final _titles = [
      'Sports',
      'Music',
      'Foods',
      'Arts',
    ];

    final _colors = [
      'FFE5625E',
      'FFE46D44',
      'FFDC42BF',
      'FFEEB868',
    ];

    for (var i = 0; i < _titles.length; i++) {
      TagModel eventType = TagModel(
        title: _titles[i],
        color: _colors[i],
        icon: Constants.eventIcons[i],
      );
      tagModels.add(eventType);
    }

    isLoading = false;
    update();
  }

  getReferredValue() async {
    referredIdsVal = '';
    final snapshot = await dbRef
        .child(Constants.referredEventRef)
        .child('${userDetail.userId}')
        .get();
    if (snapshot.exists) {
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        referredIdsVal = '$value';
      });
      update();
    }
  }

  loadEventModels() async {
    featuredEvents = [];
    eventModels = [];

    isLoading = true;
    update();

    // final snapshot = await dbRef.child(Constants.allEventsRef).get();
    // if (snapshot.exists) {
    //   final objectMap = snapshot.value as Map<Object?, Object?>;
    //   objectMap.forEach((key, value) {
    //     Map<Object?, Object?> objectMap1 = value as Map<Object?, Object?>;
    //     Map<String, dynamic> eventMap = <String, dynamic>{};
    //     objectMap1.forEach((key1, value1) {
    //       eventMap['$key1'] = value1;
    //     });
    //     if(eventMap['userId'] != userDetail.userId){
    //       final eId = eventMap['eventId'];
    //       if(!referredIdsVal.contains('$eId')){
    //         if(eventMap['userId'] == 'Not'){
    //           eventModels.add(EventModel.fromJson(eventMap));
    //         }else{
    //           featuredEvents.add(EventModel.fromJson(eventMap));
    //         }
    //       }
    //     }
    //   });
    // }

    final eventImgs = [
      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/events%2FGroup%2033318%20(1).png?alt=media&token=17423d2a-e2a8-41d6-996f-d68514f0fe0e',
      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/events%2FGroup%2033318%20(2).png?alt=media&token=7d70bc0a-a95a-486f-956b-546fc25cbf0c',
      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/events%2FGroup%2033318%20(3).png?alt=media&token=2bb4ea0e-a2cf-48b4-aee7-012464232f97',
      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/events%2FGroup%2033318.png?alt=media&token=dda3d170-038c-46cc-ba54-13044cebcd9d',
    ];

    final eTitles = [
      'CS320 Study Group :)',
      'Sowa Vintage Market THIS WKND !!!',
      'Vibe w/ Us at The Tourist Trap',
      'Resume Workshop @ HBS',
    ];

    final eLocations = [
      '36 Guild Street Boston, MA',
      '625 Commonweal',
      '36 Guild Street Boston, MA',
      '625 Commonweal',
    ];

    final eDescs = [
      'Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',
      'Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',
      'Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',
      'Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',
    ];

    final eInterestes = [
      'The best wine in Boston!',
      'Come see the new MFA ',
      'The best wine in Boston!',
      'Come see the new MFA ',
    ];

    final featuredImgs = [
      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/events%2FMask%20Group%20(1).png?alt=media&token=79cb5fb3-fc1e-40dd-b736-6956a60f6db5',
      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/events%2FMask%20Group.png?alt=media&token=e29f706d-d73a-41a1-b22d-0bad504eb9a4',
    ];

    final fTitles = [
      'Popple Launch Party 😁 ',
      'MFA Pop Up e',
    ];

    final fLocations = [
      '36 Guild Street Boston, MA',
      '625 Commonweal',
    ];

    final fDescs = [
      'Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',
      'Come celebrate friends, fun, and getting off your phone at the Popple Launch Party (hosted with Wonderland Allston). Come see local stars Zaya Marz and Yael Hayem play! Read More...',
    ];

    final fInterestes = [
      'The best wine in Boston!',
      'Come see the new MFA ',
    ];

    final _dates = [
      '10 Mar, 2023',
      '11 Mar, 2023',
      '12 Mar, 2023',
      '13 Mar, 2023',
    ];

    final _times = [
      'Tuesday, 4:00PM - 6:00PM',
      'Tuesday, 5:00PM - 7:00PM',
      'Tuesday, 6:00PM - 8:00PM',
      'Tuesday, 7:00PM - 9:00PM',
    ];

    for (var i = 0; i < eventImgs.length; i++) {
      EventModel eventModel = EventModel(
        eventName: eTitles[i],
        eventImage: eventImgs[i],
        description: eDescs[i],
        eventDate: _dates[i],
        eventStartTime: _times[i],
        location: eLocations[i],
        userImage: 'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/users%2FImage.png?alt=media&token=8fb2587f-3467-4d32-ae61-6670af6c7a6f',
        interestedIn: eInterestes[i],
      );
      eventModels.add(eventModel);
    }

    for (var i = 0; i < featuredImgs.length; i++) {
      EventModel eventModel = EventModel(
        eventName: fTitles[i],
        eventImage: featuredImgs[i],
        description: fDescs[i],
        eventDate: _dates[i],
        eventStartTime: _times[i],
        location: fLocations[i],
        userImage: 'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/users%2FImage.png?alt=media&token=8fb2587f-3467-4d32-ae61-6670af6c7a6f',
        interestedIn: fInterestes[i],
      );
      featuredEvents.add(eventModel);
    }

    isLoading = false;
    update();
  }
}
