import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF3D56F0);
Color accentColor = const Color(0xFF5994FF);
Color primaryLightColor = const Color(0xFF4A43EC);
Color pinkColor = const Color(0xFFFFE3DC);
Color bgDark = const Color(0xFFFCFCFC);
Color bgDarkWhite = const Color(0xFFFFFFFF);
Color textColor = const Color(0xff72777A);
Color bottomBarInActive = const Color(0xFF6C7072);
Color borderColor = const Color(0xFFE3E5E5);
Color subTextColor = const Color(0xFFB3B3B3);
Color descriptionColor = const Color(0xFF6C7072);
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