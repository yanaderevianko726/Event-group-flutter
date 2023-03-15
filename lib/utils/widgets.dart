import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:popuppros/models/message_channel_model.dart';
import 'package:popuppros/models/model.dart';
import 'package:popuppros/models/tent_model.dart';
import 'package:popuppros/utils/my_colors.dart';

import '../controllers/google_map_controller.dart';
import '../models/invite_event_model.dart';
import 'constant_widgets.dart';
import 'constants.dart';

Widget getCustomText(
  String text,
  Color color,
  int maxLine,
  TextAlign textAlign,
  FontWeight fontWeight,
  double textSizes,
) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: fontWeight),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

Widget slotCellUI({
  required TentModel tentModel,
}) {
  return Container(
    width: double.infinity,
    height: 56.h,
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.only(
      left: 12.h,
      right: 12.h,
      top: 14.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(12.h),
      ),
      border: Border.all(
        color: borderColor,
        width: 0.8,
      ),
    ),
    child: SizedBox(
      width: double.infinity,
      child: getCustomText(
        '\$ ${tentModel.price} ${tentModel.size1}x${tentModel.size2} ${tentModel.curTents}/${tentModel.totalTents}',
        textColor,
        1,
        TextAlign.start,
        FontWeight.w400,
        18.sp,
      ),
    ),
  );
}

Widget notificationUI({
  required NotificationModel notification,
  required Function onClick,
}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: "#2F000000".toColor(),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.notifications_active_sharp,
            size: 32.h,
            color: primaryLightColor,
          ),
          SizedBox(
            width: 12.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                ConstantWidget.getTextWidget(
                  '${notification.title}',
                  Colors.black87,
                  TextAlign.left,
                  FontWeight.w500,
                  20.sp,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 6.h,
                ),
                ConstantWidget.getTextWidget(
                  '${notification.content}',
                  textColor,
                  TextAlign.left,
                  FontWeight.w400,
                  16.sp,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12.h,
          ),
          SizedBox(
            width: 40.h,
            child: ConstantWidget.getTextWidget(
              notification.isRead == 'Not' ? 'New' : '',
              notification.isRead == 'Not' ? primaryLightColor : Colors.white,
              TextAlign.right,
              FontWeight.w400,
              16.sp,
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: 8.h,
          ),
        ],
      ),
    ),
  );
}

Widget topAppBar({
  String title = '',
  Color? titleColor,
  bool showBack = false,
  List<Widget>? icons,
}) {
  return Container(
    width: double.infinity,
    height: 80.h,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: "#2F000000".toColor(),
          blurRadius: 6,
          offset: const Offset(0, 2),
        )
      ],
    ),
    child: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCustomText(
                title,
                titleColor ?? Colors.black87.withOpacity(0.7),
                1,
                TextAlign.start,
                FontWeight.w400,
                24.sp,
              ),
            ],
          ),
        ),
        icons != null
            ? SizedBox(
                width: double.infinity,
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (var i = 0; i < icons.length; i++)
                      Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: icons.elementAt(i),
                      ),
                    SizedBox(
                      width: 16.w,
                    )
                  ],
                ),
              )
            : const SizedBox(),
        showBack == true
            ? SizedBox(
                width: double.infinity,
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 12.w,
                        margin: EdgeInsets.only(left: 12.h),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 28.h,
                          color: textColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}

Widget topIcon({
  IconData? icon,
  Color? color,
  Function? callback,
}) {
  return SizedBox(
    width: 36.h,
    height: 36.h,
    child: Center(
      child: InkWell(
        child: Icon(
          icon,
          size: 36.h,
          color: color ?? primaryLightColor,
        ),
        onTap: () => {callback!()},
      ),
    ),
  );
}

Widget upcomingSwipeCell({
  required BuildContext context,
  EventModel? eventModel,
  bool showMessage = true,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: 4.h,
          right: 4.h,
          top: 6.h,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: eventModel!.eventImage!.isNotEmpty
                  ? Image.network(
                      '${eventModel.eventImage}',
                      width: 44.h,
                      height: 44.h,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 44.h,
                      height: 44.h,
                    ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Expanded(
              child: ConstantWidget.getTextWidget(
                '${eventModel.username}',
                textColor,
                TextAlign.left,
                FontWeight.w500,
                20.sp,
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            showMessage
                ? Image.asset(
                    '${Constants.assetsImagePath}ic_chat.png',
                    width: 30.h,
                    fit: BoxFit.fitWidth,
                  )
                : SizedBox(
                    width: 30.h,
                    height: 30.h,
                  ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(14.h),
      Expanded(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: eventModel.eventImage!.isNotEmpty
                  ? Image.network(
                      '${eventModel.eventImage}',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: screenWidth,
                    ),
            ),
            // Column(
            //   children: [
            //     Container(
            //       width: screenWidth,
            //       height: 64,
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 12,
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(12),
            //           topRight: Radius.circular(12),
            //         ),
            //         color: Colors.black.withOpacity(0.55),
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //               ),
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //               ),
            //             ],
            //           ),
            //           const SizedBox(
            //             height: 6,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //               ),
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     const Spacer(),
            //     Container(
            //       width: screenWidth,
            //       height: 64,
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 12,
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius: const BorderRadius.only(
            //           bottomLeft: Radius.circular(12),
            //           bottomRight: Radius.circular(12),
            //         ),
            //         color: Colors.black.withOpacity(0.55),
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //               ),
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //                 child: Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.alarm,
            //                       size: 22,
            //                       color: Colors.white,
            //                     ),
            //                     const SizedBox(width: 8,),
            //                     ConstantWidget.getTextWidget(
            //                       '${eventModel.setupTime}',
            //                       Colors.white,
            //                       TextAlign.left,
            //                       FontWeight.w600,
            //                       18.sp,
            //                       maxLines: 2,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(
            //             height: 6,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //                 child: Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.alarm,
            //                       size: 22,
            //                       color: Colors.white,
            //                     ),
            //                     const SizedBox(width: 8,),
            //                     ConstantWidget.getTextWidget(
            //                       '${eventModel.startTime}',
            //                       Colors.white,
            //                       TextAlign.left,
            //                       FontWeight.w600,
            //                       18.sp,
            //                       maxLines: 2,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: screenWidth * 0.4,
            //                 height: 22,
            //                 child: Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.alarm,
            //                       size: 22,
            //                       color: Colors.white,
            //                     ),
            //                     const SizedBox(width: 8,),
            //                     ConstantWidget.getTextWidget(
            //                       '${eventModel.finishTime}',
            //                       Colors.white,
            //                       TextAlign.left,
            //                       FontWeight.w600,
            //                       18.sp,
            //                       maxLines: 2,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(16.h),
      Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: ConstantWidget.getTextWidget(
          '${eventModel.eventName}',
          Colors.black87,
          TextAlign.left,
          FontWeight.w600,
          20.sp,
          maxLines: 2,
        ),
      ),
      ConstantWidget.getVerSpace(14.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            Image.asset(
              '${Constants.assetsImagePath}ic_location.png',
              width: 22.h,
              fit: BoxFit.fitWidth,
            ),
            ConstantWidget.getHorSpace(12.h),
            ConstantWidget.getTextWidget(
              '${eventModel.location}',
              textColor,
              TextAlign.left,
              FontWeight.w500,
              17.sp,
              maxLines: 2,
            ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(6.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            Image.asset(
              '${Constants.assetsImagePath}ic_distance.png',
              width: 20.h,
              fit: BoxFit.fitWidth,
            ),
            ConstantWidget.getHorSpace(12.h),
            Expanded(
              child: ConstantWidget.getTextWidget(
                '30 miles away',
                subTextColor,
                TextAlign.left,
                FontWeight.w500,
                17.sp,
                maxLines: 2,
                overflow: false,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                color: primaryLightColor,
              ),
              child: ConstantWidget.getTextWidget(
                'Event',
                Colors.white,
                TextAlign.left,
                FontWeight.w500,
                18.sp,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(14.h),
      Container(
        width: screenWidth,
        margin: EdgeInsets.symmetric(
          horizontal: 16.h,
        ),
        child: ConstantWidget.getTextWidget(
          '${eventModel.description}',
          textColor,
          TextAlign.left,
          FontWeight.w500,
          18.sp,
          maxLines: 5,
        ),
      ),
      ConstantWidget.getVerSpace(8.h),
    ],
  );
}

Widget inviteSwipeCell({
  required BuildContext context,
  InviteEventModel? eventModel,
  bool showMessage = true,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: 4.h,
          right: 4.h,
          top: 6.h,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: eventModel!.image!.isNotEmpty
                  ? Image.network(
                      '${eventModel.image}',
                      width: 44.h,
                      height: 44.h,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 44.h,
                      height: 44.h,
                    ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Expanded(
              child: ConstantWidget.getTextWidget(
                '${eventModel.firstName} ${eventModel.lastName}',
                textColor,
                TextAlign.left,
                FontWeight.w500,
                20.sp,
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            showMessage
                ? Image.asset(
                    '${Constants.assetsImagePath}ic_chat.png',
                    width: 30.h,
                    fit: BoxFit.fitWidth,
                  )
                : SizedBox(
                    width: 30.h,
                    height: 30.h,
                  ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(14.h),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: eventModel.image!.isNotEmpty
              ? Image.network(
                  '${eventModel.image}',
                  width: screenWidth,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  width: screenWidth,
                ),
        ),
      ),
      ConstantWidget.getVerSpace(16.h),
      Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: ConstantWidget.getTextWidget(
          '${eventModel.venueName}',
          Colors.black87,
          TextAlign.left,
          FontWeight.w600,
          20.sp,
          maxLines: 2,
        ),
      ),
      ConstantWidget.getVerSpace(14.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            Image.asset(
              '${Constants.assetsImagePath}ic_location.png',
              width: 22.h,
              fit: BoxFit.fitWidth,
            ),
            ConstantWidget.getHorSpace(12.h),
            ConstantWidget.getTextWidget(
              '${eventModel.location}',
              textColor,
              TextAlign.left,
              FontWeight.w500,
              17.sp,
              maxLines: 2,
            ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(6.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            Image.asset(
              '${Constants.assetsImagePath}ic_distance.png',
              width: 20.h,
              fit: BoxFit.fitWidth,
            ),
            ConstantWidget.getHorSpace(12.h),
            Expanded(
              child: ConstantWidget.getTextWidget(
                '30 miles away',
                subTextColor,
                TextAlign.left,
                FontWeight.w500,
                17.sp,
                maxLines: 2,
                overflow: false,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                color: primaryLightColor,
              ),
              child: ConstantWidget.getTextWidget(
                'Event',
                Colors.white,
                TextAlign.left,
                FontWeight.w500,
                18.sp,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(14.h),
      Container(
        width: screenWidth,
        margin: EdgeInsets.symmetric(
          horizontal: 16.h,
        ),
        child: ConstantWidget.getTextWidget(
          '${eventModel.description}',
          textColor,
          TextAlign.left,
          FontWeight.w500,
          18.sp,
          maxLines: 5,
        ),
      ),
      ConstantWidget.getVerSpace(8.h),
    ],
  );
}

Widget eventsCell({
  required BuildContext context,
  required Color tagColor,
  EventModel? eventModel,
  Function? callback,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double radius = 12;
  return InkWell(
    onTap: () {
      callback!();
    },
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
            color: subTextColor.withOpacity(0.7),
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            width: screenWidth,
            height: 200.h,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                  child: Image.network(
                    '${eventModel!.eventImage}',
                    width: screenWidth,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          ConstantWidget.getVerSpace(16.h),
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: ConstantWidget.getTextWidget(
              '${eventModel.username}',
              Colors.black87,
              TextAlign.left,
              FontWeight.w600,
              20.sp,
              maxLines: 2,
            ),
          ),
          ConstantWidget.getVerSpace(14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            child: Row(
              children: [
                Image.asset(
                  '${Constants.assetsImagePath}ic_location.png',
                  width: 22.h,
                  fit: BoxFit.fitWidth,
                ),
                ConstantWidget.getHorSpace(8.h),
                ConstantWidget.getTextWidget(
                  '${eventModel.location}',
                  textColor,
                  TextAlign.left,
                  FontWeight.w500,
                  16.sp,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          ConstantWidget.getVerSpace(6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              children: [
                Image.asset(
                  '${Constants.assetsImagePath}ic_distance.png',
                  width: 20.h,
                  fit: BoxFit.fitWidth,
                ),
                ConstantWidget.getHorSpace(12.h),
                Expanded(
                  child: ConstantWidget.getTextWidget(
                    '30 miles away',
                    subTextColor,
                    TextAlign.left,
                    FontWeight.w500,
                    16.sp,
                    maxLines: 2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.h,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: tagColor,
                  ),
                  child: ConstantWidget.getTextWidget(
                    'Event',
                    Colors.white,
                    TextAlign.left,
                    FontWeight.w500,
                    18.sp,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          ConstantWidget.getVerSpace(12.h),
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(
              horizontal: 18.h,
            ),
            child: ConstantWidget.getTextWidget(
              '${eventModel.description}',
              textColor,
              TextAlign.left,
              FontWeight.w400,
              18.sp,
              maxLines: 5,
            ),
          ),
          ConstantWidget.getVerSpace(24.h),
        ],
      ),
    ),
  );
}

Widget vendorBrowserCell({
  required BuildContext context,
  VendorModel? vendorModel,
  required Function onClickMessage,
  bool showMessage = true,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: vendorModel!.image!.isNotEmpty
                  ? Image.network(
                      '${vendorModel.image}',
                      width: 44.h,
                      height: 44.h,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 44.h,
                      height: 44.h,
                    ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Expanded(
              child: ConstantWidget.getTextWidget(
                '${vendorModel.vendorName}',
                textColor,
                TextAlign.left,
                FontWeight.w500,
                20.sp,
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            showMessage
                ? InkWell(
                    onTap: () {
                      onClickMessage(vendorModel);
                    },
                    child: Image.asset(
                      '${Constants.assetsImagePath}ic_chat.png',
                      width: 30.h,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                : SizedBox(
                    width: 30.h,
                    height: 30.h,
                  ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(12.h),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            '${vendorModel.image}',
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ),
      ),
      ConstantWidget.getVerSpace(16.h),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 8.h),
        child: ConstantWidget.getTextWidget(
          '${vendorModel.vendorType}',
          Colors.black87.withOpacity(0.8),
          TextAlign.left,
          FontWeight.w500,
          20.sp,
        ),
      ),
      ConstantWidget.getVerSpace(16.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            Image.asset(
              '${Constants.assetsImagePath}ic_location.png',
              width: 22.h,
              fit: BoxFit.fitWidth,
            ),
            ConstantWidget.getHorSpace(12.h),
            ConstantWidget.getTextWidget(
              '${vendorModel.location}',
              textColor,
              TextAlign.left,
              FontWeight.w500,
              17.sp,
              maxLines: 2,
            ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(6.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(
          children: [
            Image.asset(
              '${Constants.assetsImagePath}ic_distance.png',
              width: 20.h,
              fit: BoxFit.fitWidth,
            ),
            ConstantWidget.getHorSpace(12.h),
            Expanded(
              child: ConstantWidget.getTextWidget(
                '30 miles away',
                subTextColor,
                TextAlign.left,
                FontWeight.w500,
                17.sp,
                maxLines: 2,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                color: primaryLightColor,
              ),
              child: ConstantWidget.getTextWidget(
                'Vendor',
                Colors.white,
                TextAlign.left,
                FontWeight.w500,
                18.sp,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      ConstantWidget.getVerSpace(12.h),
      Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
        ),
        child: ConstantWidget.getTextWidget(
          '${vendorModel.serviceDescription}',
          textColor,
          TextAlign.left,
          FontWeight.w500,
          18.sp,
          maxLines: 5,
        ),
      ),
    ],
  );
}

Widget swipeBottomButton({
  double width = 60,
  double imgRate = 0.4,
  double radius = 40,
  String? image,
  Color bgColor = Colors.white,
  Function? onClick,
}) {
  return InkWell(
    onTap: () {
      onClick!();
    },
    child: Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
        color: bgColor,
      ),
      child: Center(
        child: Image.asset(
          image!,
          width: width * imgRate,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

Widget googleMapWidget(
    {required BuildContext context,
    required MapController controller,
    Function? onMapCreated}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: GoogleMap(
        circles: {controller.circles.value},
        markers:
            Set.from((controller.marker != null) ? [controller.marker!] : []),
        mapType: MapType.normal,
        initialCameraPosition: controller.kGooglePlex.value,
        onMapCreated: (googleMapController) {
          onMapCreated!(googleMapController);
        },
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: false,
        rotateGesturesEnabled: false,
        zoomControlsEnabled: false,
      ),
    ),
  );
}

getProgressDialog({Color? color}) {
  return Container(
      decoration: BoxDecoration(
        color: color ?? CupertinoColors.white,
      ),
      child: color == null
          ? const Center(child: CupertinoActivityIndicator())
          : const Center(
              child: CupertinoActivityIndicator(color: Colors.white)));
}

Widget dropdownMenu({
  List<String>? items,
  String? selectedValue,
  double? buttonWidth,
  double buttonPadding = 14,
  Function? onChanged,
}) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2(
      isExpanded: true,
      hint: Row(
        children: const [
          Expanded(
            child: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            Icons.arrow_drop_down_sharp,
            size: 16,
            color: Colors.yellow,
          ),
        ],
      ),
      items: items!
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        onChanged!(value);
      },
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
      ),
      iconSize: 24,
      iconEnabledColor: primaryColor,
      iconDisabledColor: Colors.grey,
      buttonHeight: 48,
      buttonWidth: buttonWidth,
      buttonPadding: EdgeInsets.only(left: buttonPadding, right: buttonPadding),
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
        ),
        color: Colors.white,
      ),
      buttonElevation: 0,
      itemHeight: 40,
      itemPadding: const EdgeInsets.only(left: 14, right: 14),
      dropdownMaxHeight: 200,
      dropdownWidth: buttonWidth,
      dropdownPadding: null,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      dropdownElevation: 6,
      scrollbarRadius: const Radius.circular(40),
      scrollbarThickness: 6,
      scrollbarAlwaysShow: true,
    ),
  );
}

Widget eventCell(
  BuildContext context,
  EventModel eventModel,
  int index,
  Color viewColor,
  Function onClickCell,
) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      InkWell(
        onTap: () {
          onClickCell();
        },
        child: Container(
          width: screenWidth,
          margin: EdgeInsets.only(
            left: 12.h,
            right: 12.h,
            top: index == 0 ? 14.h : 10.h,
            bottom: 10.h,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  '${eventModel.eventImage}',
                  width: 88.h,
                  height: 88.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ConstantWidget.getTextWidget(
                          '${eventModel.eventName}',
                          Colors.black87,
                          TextAlign.left,
                          FontWeight.w500,
                          18.sp,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 5.h),
                        child: ConstantWidget.getTextWidget(
                          'Start: ${eventModel.createdAt}',
                          textColor,
                          TextAlign.left,
                          FontWeight.w500,
                          15.sp,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 5.h),
                        child: Row(
                          children: [
                            Image.asset(
                              '${Constants.assetsImagePath}ic_location.png',
                              width: 24.h,
                              fit: BoxFit.fitWidth,
                            ),
                            ConstantWidget.getHorSpace(12.h),
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: ConstantWidget.getTextWidget(
                                '${eventModel.location}',
                                textColor,
                                TextAlign.left,
                                FontWeight.w500,
                                13.sp,
                                maxLines: 2,
                                overflow: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 68.h,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: viewColor,
                ),
                child: Center(
                  child: ConstantWidget.getTextWidget(
                    'View',
                    Colors.white,
                    TextAlign.left,
                    FontWeight.w500,
                    18.sp,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 1.h,
        color: borderColor,
      ),
    ],
  );
}

Widget inviteEventCell(
  BuildContext context,
  InviteEventModel eventModel,
  int index,
  Color viewColor,
  Function onClickCell,
) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      InkWell(
        onTap: () {
          onClickCell();
        },
        child: Container(
          width: screenWidth,
          margin: EdgeInsets.only(
            left: 12.h,
            right: 12.h,
            top: index == 0 ? 14.h : 10.h,
            bottom: 10.h,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  '${eventModel.image}',
                  width: 88.h,
                  height: 88.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ConstantWidget.getTextWidget(
                          '${eventModel.venueName}',
                          Colors.black87,
                          TextAlign.left,
                          FontWeight.w500,
                          18.sp,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 5.h),
                        child: ConstantWidget.getTextWidget(
                          'Start: ${eventModel.startTime}, Finish: ${eventModel.finishTime}',
                          textColor,
                          TextAlign.left,
                          FontWeight.w500,
                          15.sp,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 5.h),
                        child: Row(
                          children: [
                            Image.asset(
                              '${Constants.assetsImagePath}ic_location.png',
                              width: 24.h,
                              fit: BoxFit.fitWidth,
                            ),
                            ConstantWidget.getHorSpace(12.h),
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: ConstantWidget.getTextWidget(
                                '${eventModel.location}',
                                textColor,
                                TextAlign.left,
                                FontWeight.w500,
                                13.sp,
                                maxLines: 2,
                                overflow: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 68.h,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: viewColor,
                ),
                child: Center(
                  child: ConstantWidget.getTextWidget(
                    'View',
                    Colors.white,
                    TextAlign.left,
                    FontWeight.w500,
                    18.sp,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 1.h,
        color: borderColor,
      ),
    ],
  );
}

Widget slotCell({
  required TentModel tentSlot,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: 8.h,
      left: 18.h,
      right: 18.h,
    ),
    child: Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.only(left: 12.h, right: 12.h, top: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.h),
        ),
        border: Border.all(
          width: 0.8,
          color: borderColor,
        ),
      ),
      child: ConstantWidget.getTextWidget(
        "\$ ${tentSlot.price} ${tentSlot.size1} x ${tentSlot.size2} 0/${tentSlot.totalTents}",
        textColor,
        TextAlign.start,
        FontWeight.w500,
        19.sp,
      ),
    ),
  );
}

Widget approvedVendorWidget({
  required UserDetail userDetail,
  required VendorModel vendorModel,
  required EventModel eventModel,
}) {
  String applied = '${Constants.approvedBy}${eventModel.eventId}';
  String invited = '${Constants.invitedBy}${eventModel.eventId}';
  return Container(
    width: double.infinity,
    height: 72,
    margin: EdgeInsets.only(left: 12, right: 12, top: 9.h, bottom: 3),
    padding: EdgeInsets.symmetric(horizontal: 12.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.h)),
      boxShadow: [
        BoxShadow(
          color: subTextColor,
          blurRadius: 4,
          offset: const Offset(0, 0),
        )
      ],
    ),
    child: Column(
      children: [
        const Spacer(),
        Row(
          children: [
            Container(
              width: 64.h,
              height: 64.h,
              margin: EdgeInsets.only(right: 12.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: vendorModel.image!.isNotEmpty
                    ? Image.network(
                        '${vendorModel.image}',
                        width: 64.h,
                        height: 64.h,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "${Constants.assetsImagePath}profile_imge.png",
                        width: 64.h,
                        height: 64.h,
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomText(
                    '${vendorModel.vendorName}',
                    Colors.black87,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    18.sp,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, left: 6.h),
                    child: getCustomText(
                      '${vendorModel.serviceDescription}',
                      textColor,
                      1,
                      TextAlign.start,
                      FontWeight.w400,
                      16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12.h, right: 8.h),
              child: getCustomText(
                vendorModel.status!.contains(applied)
                    ? 'Approved'
                    : vendorModel.status!.contains(invited)
                        ? 'Invited'
                        : 'Pending',
                textColor,
                1,
                TextAlign.start,
                FontWeight.w400,
                18.sp,
              ),
            ),
            Container(
              width: 8.h,
              height: 8.h,
              decoration: BoxDecoration(
                  color: vendorModel.status!.contains(applied)
                      ? Colors.green
                      : vendorModel.status!.contains(invited)
                          ? Colors.lightBlueAccent
                          : Colors.blueGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
          ],
        ),
        const Spacer(),
      ],
    ),
  );
}

Widget approvedMessageCell({
  required MessageChannelModel messageChannelModel,
  required Function callback,
}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          callback();
        },
        child: Container(
          width: double.infinity,
          height: 64,
          margin: const EdgeInsets.only(top: 3),
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          color: Colors.white,
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 60.h,
                    height: 60.h,
                    margin: EdgeInsets.only(right: 16.h, left: 8.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35.0),
                      child: messageChannelModel.otherImage!.isNotEmpty
                          ? Image.network(
                              '${messageChannelModel.otherImage}',
                              width: 60.h,
                              height: 60.h,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "${Constants.assetsImagePath}profile_imge.png",
                              width: 60.h,
                              height: 60.h,
                            ),
                    ),
                  ),
                  Expanded(
                    child: getCustomText(
                      '${messageChannelModel.otherName}',
                      Colors.black87,
                      1,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.h,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.h,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 0.8,
        color: borderColor,
      )
    ],
  );
}
