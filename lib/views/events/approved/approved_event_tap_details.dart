import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/utils/constants.dart';
import 'package:popuppros/utils/widgets.dart';

import '../../../controllers/events/approved/approved_event_view_controller.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';

class ApprovedEventTapDetails extends StatefulWidget {
  const ApprovedEventTapDetails({Key? key, }) : super(key: key);

  @override
  State<ApprovedEventTapDetails> createState() => _ApprovedEventTapDetails();
}

class _ApprovedEventTapDetails extends State<ApprovedEventTapDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horPadding = 18.h;
    double pieceWidth = (screenWidth - horPadding*2 - 12.h) / 2;
    return GetBuilder<ApprovedEventViewController>(
      init: ApprovedEventViewController(),
      builder: (eventController) => Container(
        width: screenWidth,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: horPadding, vertical: 18.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: getCustomText(
                  'Location',
                  Colors.black87,
                  1,
                  TextAlign.start,
                  FontWeight.w400,
                  19.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 8.h, right: 8.h),
                child: Row(
                  children: [
                    Image.asset(
                      '${Constants.assetsImagePath}ic_location.png',
                      width: 22.h,
                      fit: BoxFit.fitWidth,
                    ),
                    ConstantWidget.getHorSpace(12.h),
                    ConstantWidget.getTextWidget(
                      '${eventController.approvedEventModel.eventModel!.location}',
                      textColor,
                      TextAlign.left,
                      FontWeight.w500,
                      17.sp,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: getCustomText(
                  'Setup Time',
                  Colors.black87,
                  1,
                  TextAlign.start,
                  FontWeight.w400,
                  18.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.h, top: 12.h),
                child: Row(
                  children: [
                    Image.asset(
                      '${Constants.assetsImagePath}ic_clock.png',
                      width: 22.h,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 12.h,),
                    getCustomText(
                      '${eventController.approvedEventModel.eventModel!.createdAt}',
                      textColor,
                      1,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: pieceWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomText(
                            'Start Time',
                            Colors.black87,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            18.sp,
                          ),
                          SizedBox(height: 12.h,),
                          Row(
                            children: [
                              SizedBox(width: 12.h,),
                              Image.asset(
                                '${Constants.assetsImagePath}ic_calendar_black.png',
                                width: 22.h,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(width: 12.h,),
                              getCustomText(
                                '${eventController.approvedEventModel.eventModel!.createdAt}',
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.w400,
                                18.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: getCustomText(
                  'Description',
                  Colors.black87,
                  1,
                  TextAlign.start,
                  FontWeight.w400,
                  19.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.h),
                child: Text(
                  '${eventController.approvedEventModel.eventModel!.description}',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.sp,
                    color: textColor,
                    fontFamily: Constants.fontsFamily,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
