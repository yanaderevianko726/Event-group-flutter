import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'constant_widgets.dart';

void exitApp() {
  if (Platform.isIOS) {
    exit(0);
  } else {
    SystemNavigator.pop();
  }
}

class Constants {
  static String packageName = "com.popupprops.hostsapp";
  static String appStoreIdentifier = "1562289688";
  static String assetsImagePath = "assets/images/";
  static String iconsImagePath = "assets/icons/";
  static String assetsImageFormat = "";
  static const String fontsFamily = 'SF Pro Display';
  static String privacyURL = 'https://google.com';

  static String usersRef = 'Users';
  static String vendorsRef = 'Vendors';
  static String allEventsRef = 'AllEvents';
  static String messagesRef = 'Messages';
  static String messageChannelsRef = 'MessageChannels';
  static String hostingEventsRef = 'HostingEvents';
  static String approvedEventsRef = 'ApprovedEvents';
  static String invitedEventsRef = 'InvitedEvents';
  static String notificationsRef = 'Notifications';
  static String referredEventRef = 'ReferredEvent';
  static String referredVendorsRef = 'ReferredVendors';
  static String approvedVendorsRef = 'ApprovedVendors';
  static String approvedBy = 'approvedby_';
  static String invitedBy = 'invitedby_';

  static const int seasonalId = 2;
  static final formatter = NumberFormat("#.##");
  static DateFormat addDateFormat = DateFormat("dd-MM-yyyy", "en-US");
  static DateFormat showDateFormat = DateFormat("EEE dd MMMM", "en-US");
  static DateFormat timeFormats = DateFormat("mm:ss", "en-US");
  static DateFormat historyTitleDateFormat = DateFormat("MMMM dd, yyyy", "en-US");
  static const String defTimeZoneName = "America/Detroit";

  static List<String> userImageUrl = [
    'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/events%2Fbooking-5.png?alt=media&token=6fc0b6a2-9590-4ad4-956a-71db8880a0aa',
    'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/events%2Fidea.png?alt=media&token=984d9732-5fa6-44f5-aff8-1c95a43a7595',
    'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/events%2Fimage%20(2).png?alt=media&token=1b0e6d7b-ae9a-46c0-95dc-0b5db3fd87d9',
  ];

  static List<String> tmpFNames = [
    'Alina',
    'Anastasia',
    'Nastya',
  ];

  static List<String> tmpLNames = [
    'Kudryashova',
    'Duzenko',
    'Adamova',
  ];

  static List<String> tmpImageUrl = [
    'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/events%2Fbooking-5.png?alt=media&token=6fc0b6a2-9590-4ad4-956a-71db8880a0aa',
    'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/events%2Fidea.png?alt=media&token=984d9732-5fa6-44f5-aff8-1c95a43a7595',
    'https://firebasestorage.googleapis.com/v0/b/popuppros-d9cba.appspot.com/o/events%2Fimage%20(2).png?alt=media&token=1b0e6d7b-ae9a-46c0-95dc-0b5db3fd87d9',
  ];

  static List<String> venueNames = [
    'Dogwood Festival',
    'Dogiron Festival',
    'Dogwater Festival',
  ];

  static List<String> typeList = [
    'Food Tent',
    'Food Truck',
    'Entertainer',
  ];

  static List<String> eventIds = [
    '-NOvX6yKi9lkoE34a8SW',
    '-NOvvKRDrOgzDYRGG5P-',
    'u3PaTyc6D9PxBpe4UKoOhCRu8Nj2',
  ];

  static List<String> userIds = [
    'kP7AsPAa9mdjjolonyYlGRncFN03',
    'tiBOtJ9flJg2s7UHG1qPHjVrAHp2',
    'tiBOtJ9flJg2s7UHG1qPHjVrAHp2',
  ];

  static Future<String> currentTimeUTC() async {
    String formattedDate = DateFormat('yyyy-MM-dd-HH-mm-ss').format(DateTime.now().toUtc());
    return formattedDate;
  }

  static bool isNotEmpty(String s) {
    return (s.isNotEmpty);
  }

  static sendToScreen(Widget widget, BuildContext context, ValueChanged<dynamic> setChange) {
    Get.to(() => widget)!.then(setChange);
  }

  static sendToScreen1(BuildContext context, var route, {Object? arguments}) {
    if (arguments != null) {
      Get.to(route, arguments: arguments);
    } else {
      Get.to(route);
    }
  }

  static double getScreenPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height * percent) / 100;
  }

  static double getDefaultHorizontalMargin(BuildContext context) {
    return ConstantWidget.getWidthPercentSize(context, 3.5);
  }

  static double getWidthPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.width * percent) / 100;
  }

  static double getPercentSize(double total, double percent) {
    return (total * percent) / 100;
  }

  static Color getColorFromHex(String colors) {
    var color = "0xFF$colors";
    try {
      return Color(int.parse(color));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Color(0xFFFFFFFF);
    }
  }

  static format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  static formatMinutes(Duration d) => d.toString().substring(2, 7);

  static String getTimeFromSec(int sec) {
    final d1 = Duration(seconds: sec);
    return format(d1);
  }

  static String getMMSSFromSec(int sec) {
    final d1 = Duration(seconds: sec);
    return formatMinutes(d1);
  }

  static showToast(String s) {
    Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  static String getAppLink() {
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=$packageName";
    } else if (Platform.isIOS) {
      return "https://apps.apple.com/us/app/apple-store/id$appStoreIdentifier";
    }
    return "";
  }

  static Color darken(Color c, [int percent = 30]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
        c.alpha,
        (c.red * f).round(),
        (c.green * f).round(),
        (c.blue * f).round()
    );
  }

  static Color brighten(Color c, [int percent = 15]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round()
    );
  }
}
