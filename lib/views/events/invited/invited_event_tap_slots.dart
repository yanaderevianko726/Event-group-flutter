import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/events/invited/invited_event_view_controller.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';

class InvitedEventTapSlots extends StatefulWidget {
  const InvitedEventTapSlots({
    Key? key,
  }) : super(key: key);

  @override
  State<InvitedEventTapSlots> createState() => _InvitedEventTapSlots();
}

class _InvitedEventTapSlots extends State<InvitedEventTapSlots> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<InvitedEventViewController>(
      init: InvitedEventViewController(),
      builder: (eventController) => Stack(
        children: [
          Container(
            width: screenWidth,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomText(
                    'Available Slots',
                    Colors.black87,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    20.sp,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  for (var i = 0; i < eventController.tentModels.length; i++)
                    slotCellUI(
                      tentModel: eventController.tentModels[i],
                    ),
                  SizedBox(
                    height: 132.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: getButton(
                      context,
                      primaryColor,
                      "Apply",
                      Colors.white,
                      () {
                        onClickAcceptInvite(eventController);
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: eventController.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: primaryLightColor,
                      backgroundColor: const Color(0x0F000000),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  onClickAcceptInvite(InvitedEventViewController inviteController) {
    onConfirmInvite((val) {
      if (val) {
        inviteController.applyInvite((ret) {
          if (ret) {
            Get.back();
          }
        });
      }
    });
  }

  onConfirmInvite(
    Function callback,
  ) async {
    double btnWidth = (MediaQuery.of(context).size.width - 80) / 2;
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              ConstantWidget.getVerSpace(32.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ConstantWidget.getCustomTextWidget(
                      'Accept Invite Event',
                      Colors.black,
                      22.sp,
                      FontWeight.w700,
                      TextAlign.start,
                      1,
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: getCustomText(
                  "Do you want to accept this invite?",
                  textColor,
                  1,
                  TextAlign.start,
                  FontWeight.w500,
                  18.sp,
                ),
              ),
              ConstantWidget.getVerSpace(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: btnWidth,
                    child: getButton(
                      context,
                      primaryColor,
                      "Yes",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                        callback(true);
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(
                    width: 28.h,
                  ),
                  SizedBox(
                    width: btnWidth,
                    child: getButton(
                      context,
                      primaryColor,
                      "No",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                        callback(false);
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(16.h),
            ],
          ),
        );
      },
    );
  }
}
