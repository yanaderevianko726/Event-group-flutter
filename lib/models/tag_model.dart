import 'package:flutter/material.dart';

class TagModel {
  String title;
  String color;
  String? icon;

  TagModel({
    this.title = '',
    this.color = 'FFE5625E',
    this.icon = 'sports',
  });

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
        title: json["title"] ?? '',
        color: json["color"] ?? '',
        icon: json["icon"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "color": color,
        "icon": icon,
      };
}
