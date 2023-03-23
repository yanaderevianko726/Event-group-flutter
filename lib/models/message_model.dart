import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popuppros/models/model.dart';
import 'package:popuppros/utils/my_colors.dart';

import '../utils/constants.dart';
import '../utils/widgets.dart';

class MessageModel {
  String? id;
  String? channelId;
  String? senderId;
  String? senderName;
  String? senderImage;
  String? isFile;
  String? msg;
  String? isRead;

  MessageModel({
    this.id = '',
    this.channelId = '',
    this.senderId = '',
    this.senderName = '',
    this.senderImage = '',
    this.isFile = '',
    this.msg = '',
    this.isRead = '',
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"] ?? '',
        channelId: json["channelId"] ?? '',
        senderId: json["senderId"] ?? '',
        senderName: json["senderName"] ?? '',
        senderImage: json["senderImage"] ?? '',
        isFile: json["isFile"] ?? '',
        msg: json["msg"] ?? '',
        isRead: json["isRead"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "channelId": channelId,
        "senderId": senderId,
        "senderName": senderName,
        "senderImage": senderImage,
        "isFile": isFile,
        "msg": msg,
        "isRead": isRead,
      };

  Widget messageCell({
    required BuildContext context,
    UserDetail? userDetail,
    Function? onClickCell,
  }) {
    return userDetail!.userId == senderId
        ? myMessageCell(
            context: context,
            userDetail: userDetail,
            onClickCell: onClickCell,
          )
        : otherMessageCell(
            context: context,
            userDetail: userDetail,
            onClickCell: onClickCell,
          );
  }

  Widget myMessageCell({
    required BuildContext context,
    UserDetail? userDetail,
    Function? onClickCell,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 6.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: msg!.length <= 5
                ? screenWidth * 0.16
                : msg!.length <= 15
                    ? screenWidth * 0.32
                    : msg!.length <= 25
                        ? screenWidth * 0.5
                        : screenWidth * 0.65,
            padding: EdgeInsets.all(12.h),
            margin: EdgeInsets.only(
              right: 8.h,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                )
              ],
              color: borderColor,
            ),
            child: getCustomText(
              '$msg',
              Colors.black87.withOpacity(0.7),
              5,
              TextAlign.start,
              FontWeight.w400,
              18.sp,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: senderImage!.isNotEmpty
                ? Image.network(
                    '$senderImage',
                    width: 40.h,
                    height: 40.h,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "${Constants.assetsImagePath}profile_imge.png",
                    width: 40.h,
                    height: 40.h,
                  ),
          ),
        ],
      ),
    );
  }

  Widget otherMessageCell({
    required BuildContext context,
    UserDetail? userDetail,
    Function? onClickCell,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 6.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: senderImage!.isNotEmpty
                ? Image.network(
                    '$senderImage',
                    width: 40.h,
                    height: 40.h,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "${Constants.assetsImagePath}profile_imge.png",
                    width: 40.h,
                    height: 40.h,
                  ),
          ),
          Container(
            width: msg!.length <= 5
                ? screenWidth * 0.16
                : msg!.length <= 15
                    ? screenWidth * 0.32
                    : msg!.length <= 25
                        ? screenWidth * 0.5
                        : screenWidth * 0.65,
            padding: EdgeInsets.all(12.h),
            margin: EdgeInsets.only(
              left: 8.h,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
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
            child: getCustomText(
              '$msg',
              Colors.black87.withOpacity(0.7),
              5,
              TextAlign.start,
              FontWeight.w400,
              18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
