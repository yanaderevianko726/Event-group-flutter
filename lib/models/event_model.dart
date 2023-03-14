import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constant_widgets.dart';
import '../utils/constants.dart';
import '../utils/my_colors.dart';

class EventModel {
  String? eventId;
  String? eventName;
  String? eventImage;
  String? description;
  String? userId;
  String? username;
  String? userImage;
  String? addressLine1;
  String? location;
  String? lat;
  String? lang;
  String? interestedIn;
  String? featured;
  String? bookMark;
  String? eventDate;
  String? eventTime;
  String? createdAt;

  EventModel({
    this.eventId = '',
    this.userId = '',
    this.username = '',
    this.eventName = '',
    this.description = '',
    this.userImage = '',
    this.eventImage = '',
    this.addressLine1 = '',
    this.location = '',
    this.lat = '',
    this.lang = '',
    this.interestedIn = '',
    this.featured = 'Not',
    this.bookMark = 'Not',
    this.eventDate = '',
    this.eventTime = '',
    this.createdAt = '',
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventId: json["eventId"] ?? '',
        eventName: json["eventName"] ?? '',
        description: json["description"] ?? '',
        eventImage: json["eventImage"] ?? '',
        userId: json["userId"] ?? '',
        username: json["username"] ?? '',
        userImage: json["userImage"] ?? '',
        addressLine1: json["addressLine1"] ?? '',
        location: json["location"] ?? '',
        lat: json["lat"] ?? '',
        lang: json["lang"] ?? '',
        interestedIn: json["interestedIn"] ?? '',
        featured: json["featured"] ?? 'Not',
        bookMark: json["bookMark"] ?? 'Not',
        eventDate: json["eventDate"] ?? '',
        eventTime: json["eventTime"] ?? '',
        createdAt: json["createdAt"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "description": description,
        "eventImage": eventImage,
        "userId": userId,
        "username": username,
        "userImage": userImage,
        "addressLine1": addressLine1,
        "location": location,
        "lat": lat,
        "lang": lang,
        "interestedIn": interestedIn,
        "featured": featured,
        "bookMark": bookMark,
        "eventDate": eventDate,
        "eventTime": eventTime,
        "createdAt": createdAt,
      };

  Widget featuredWidget(BuildContext context, Function callback) {
    double screenWidth = MediaQuery.of(context).size.width;
    double borderRadius = 15;
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        width: screenWidth * 0.6,
        height: Constants.featuredEventHeight,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 3,
              offset: const Offset(0, 1),
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              child: eventImage!.isNotEmpty
                  ? Image.network(
                      '$eventImage',
                      width: double.infinity,
                      height: Constants.featuredEventHeight * 0.54,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: Constants.featuredEventHeight * 0.54,
                    ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ConstantWidget.getTextWidget(
                '$eventName',
                textColor,
                TextAlign.start,
                FontWeight.w400,
                22.sp,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ConstantWidget.getTextWidget(
                      '$location',
                      descriptionColor,
                      TextAlign.start,
                      FontWeight.w400,
                      16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2),
              child: ConstantWidget.getTextWidget(
                '$description',
                descriptionColor,
                TextAlign.start,
                FontWeight.w400,
                15.sp,
                maxLines: 1,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/ic_user.png',
                    color: Colors.grey,
                    width: 18,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ConstantWidget.getTextWidget(
                      '$interestedIn',
                      descriptionColor,
                      TextAlign.start,
                      FontWeight.w400,
                      15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventWidget(BuildContext context, Function callback) {
    double borderRadius = 15;
    final fLocation =
        location!.length >= 15 ? location!.substring(0, 14) : location;
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        width: double.infinity,
        height: Constants.eventHeight,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 3,
              offset: const Offset(0, 1),
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              child: eventImage!.isNotEmpty
                  ? Image.network(
                      '$eventImage',
                      width: double.infinity,
                      height: Constants.eventHeight * 0.6,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: Constants.eventHeight * 0.6,
                    ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ConstantWidget.getTextWidget(
                '$eventName',
                textColor,
                TextAlign.start,
                FontWeight.w400,
                20.sp,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$fLocation',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Image.asset(
                    'assets/images/ic_user.png',
                    color: Colors.grey,
                    width: 18,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$fLocation',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
