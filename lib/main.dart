// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'utils/my_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB4INkzPNaTlYMEiXSlVE7eDDaGL2xWAWQ",
        appId: "1:238824124023:web:6c3e078daa130c63b22072",
        messagingSenderId: "238824124023",
        projectId: "popuppros-d9cba",
      ),
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB4bPCsNusePpowjVoBTauC9OFNRdN9Sbc",
        appId: "1:238824124023:ios:e0ed6c48f36b9acdb22072",
        messagingSenderId: "238824124023",
        projectId: "popuppros-d9cba",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: accentColor,
    ),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EventHub',
      theme: themeData,
      initialRoute: AppPages.initialRoute,
      routes: AppPages.routes,
    );
  }
}
