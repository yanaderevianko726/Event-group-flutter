import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF3D56F0);
Color accentColor = const Color(0xFF5669FF);
Color primaryLightColor = const Color(0xFF4A43EC);
Color pinkColor = const Color(0xFFFFE3DC);
Color purpleColor = const Color(0xFF615BC9);
Color bgDark = const Color(0xFFFCFCFC);
Color bgDarkWhite = const Color(0xFFFFFFFF);
Color textColor = const Color(0xff72777A);
Color bottomBarInActive = const Color(0xFF6C7072);
Color borderColor = const Color(0xFFE4DFDF);
Color subTextColor = const Color(0xFFB3B3B3);
Color disabledColor = const Color(0xFFB8B7C7);
Color descriptionColor = const Color(0xFF6C7072);
Color redLightColor = const Color(0xFFE5625E);
Color redLight1Color = const Color(0xFFE46D44);
Color redLight2Color = const Color(0xFFDC42BF);
Color redLight3Color = const Color(0xFFEEB868);
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