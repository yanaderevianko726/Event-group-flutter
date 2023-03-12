import 'package:flutter/material.dart';

class EventType {
  String title;
  String color;
  String? icon;

  EventType({
    this.title = '',
    this.color = 'FFE5625E',
    this.icon = 'sports',
  });

  factory EventType.fromJson(
    Map<String, dynamic> json,
  ) =>
      EventType(
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
