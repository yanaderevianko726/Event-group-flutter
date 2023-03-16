import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF3D56F0);
Color accentColor = const Color(0xFF5669FF);
Color primaryLightColor = const Color(0xFF4A43EC);
Color blueLight = const Color(0xFF5994FF);
Color blueDark = const Color(0xFF4470BF);
Color pinkColor = const Color(0xFFFFE3DC);
Color pinkLightColor = const Color(0xFFF6C2CC);
Color purpleColor = const Color(0xFF615BC9);
Color purpleLightColor = const Color(0xFF5a4589);
Color purpleDarkColor = const Color(0xFF413D8B);
Color purpleDeepDarkColor = const Color(0xFF160e31);
Color tag1Color = const Color(0xFF273E47);
Color tag2Color = const Color(0xFF46CDFB);
Color tag3Color = const Color(0xFFEF767A);
Color tag4Color = const Color(0xFF49DCB1);
Color bgDark = const Color(0xFFFCFCFC);
Color bgDarkWhite = const Color(0xFFFFFFFF);
Color textColor = const Color(0xff120D26);
Color bottomBarInActive = const Color(0xFF6C7072);
Color borderColor = const Color(0xFFE4DFDF);
Color subTextColor = const Color(0xFFB3B3B3);
Color disabledColor = const Color(0xFFB8B7C7);
Color descriptionColor = const Color(0xFF6C7072);
Color redLightColor = const Color(0xFFE5625E);
Color redLight1Color = const Color(0xFFE46D44);
Color redLight2Color = const Color(0xFFDC42BF);
Color redLight3Color = const Color(0xFFEEB868);
Color redLight4Color = const Color(0xFFff4d9e);
Color bgLightWhite = const Color(0xFFeef0f7);
Color containerShadow = "#33ACB6B5".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}