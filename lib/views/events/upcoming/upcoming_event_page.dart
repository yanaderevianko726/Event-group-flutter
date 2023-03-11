// ignore_for_file: library_private_types_in_public_api
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';
import 'package:popuppros/models/event_model.dart';
import 'package:popuppros/utils/functions.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../controllers/events/upcoming/upcoming_event_controller.dart';
import '../../../models/tent_model.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';

class UpcomingEventsPage extends StatefulWidget {
  const UpcomingEventsPage({super.key});

  @override
  _UpcomingWidget createState() => _UpcomingWidget();
}

class _UpcomingWidget extends State<UpcomingEventsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpComingEventsController>(
      init: UpComingEventsController(),
      builder: (eventController) => GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) => Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: bgDarkWhite,
              child: Column(
                children: [
                  topAppBar(
                    title: 'Upcoming',
                    icons: [
                      SizedBox(
                        width: 36.h,
                        height: 36.h,
                        child: notificationController.notificationCount > 0
                            ? Badge(
                                label: Text(
                                  '${notificationController.notificationCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(
                                    Icons.notifications_none,
                                    size: 36.h,
                                    color: primaryLightColor,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.notificationRoute);
                                  },
                                ),
                              )
                            : Center(
                                child: InkWell(
                                  child: Icon(
                                    Icons.notifications_none,
                                    size: 36.h,
                                    color: primaryLightColor,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.notificationRoute);
                                  },
                                ),
                              ),
                      ),
                      topIcon(
                        icon: Icons.search,
                        callback: () {},
                      ),
                    ],
                  ),
                  ConstantWidget.getVerSpace(20.h),
                  if (eventController.swipeItems.isNotEmpty)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 10.h,
                        ),
                        child: SwipeCards(
                          matchEngine: eventController.matchEngine!,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                left: 12.h,
                                right: 12.h,
                                top: 8.h,
                                bottom: 26.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: subTextColor.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                                color: Colors.white,
                              ),
                              child: upcomingSwipeCell(
                                context: context,
                                eventModel:
                                    eventController.swipeItems[index].content,
                                showMessage: false,
                              ),
                            );
                          },
                          onStackFinished: () {
                            if (kDebugMode) {
                              print("Stack Finished");
                            }
                          },
                          itemChanged: (SwipeItem item, int index) {
                            if (kDebugMode) {
                              print(
                                  "item: ${item.content.firstName}, index: $index");
                            }
                          },
                          leftSwipeAllowed: true,
                          rightSwipeAllowed: true,
                        ),
                      ),
                    ),
                  ConstantWidget.getVerSpace(12.h),
                  if (eventController.swipeItems.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h,
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            swipeBottomButton(
                              image:
                                  '${Constants.assetsImagePath}ic_refresh.png',
                              onClick: () {
                                eventController.matchEngine!.currentItem
                                    ?.nope();
                              },
                            ),
                            swipeBottomButton(
                              width: 68,
                              imgRate: 0.55,
                              bgColor: Colors.green,
                              image: '${Constants.assetsImagePath}155884.png',
                              onClick: () {
                                onClickApply(eventController, context);
                              },
                            ),
                            swipeBottomButton(
                              image: '${Constants.assetsImagePath}ic_star.png',
                              onClick: () {
                                eventController.matchEngine!.currentItem
                                    ?.like();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ConstantWidget.getVerSpace(20.h),
                ],
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
      ),
    );
  }

  onClickApply(UpComingEventsController eventController, BuildContext context) {
    if (eventController.vendorModel.vendorName!.isNotEmpty) {
      EventModel eventModel =
          eventController.matchEngine!.currentItem!.content as EventModel;
      List<TentModel> tentModels = [];
      List<String> tentSizes = [];
      List<dynamic> tentMap =
          jsonDecode(eventModel.tentSlots!) as List<dynamic>;
      for (var element in tentMap) {
        Map<String, dynamic> eleMap = element;
        TentModel tentModel = TentModel.fromJson(eleMap);
        tentModels.add(tentModel);
        tentSizes.add(
            '\$ ${tentModel.price} ${tentModel.size1}x${tentModel.size2} ${tentModel.curTents}/${tentModel.totalTents}');
      }
      if (tentSizes.isNotEmpty) {
        eventController.setSelectedSize(tentSizes[0], 0);
        showTentAlertSheet(eventController, context, tentModels, tentSizes);
      } else {
        Functions.showToast('This event has no tent slots');
      }
    } else {
      showVendorAlertSheet(eventController, context);
    }
  }

  showTentAlertSheet(
    UpComingEventsController eventController,
    BuildContext context,
    List<TentModel> tentModels,
    List<String> tentSizes,
  ) async {
    double screenWidth = MediaQuery.of(context).size.width;
    EventModel eventModel =
        eventController.matchEngine!.currentItem!.content as EventModel;
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
          ),
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              ConstantWidget.getVerSpace(8.h),
              Container(
                width: double.infinity,
                height: 8.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 112.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: borderColor,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 36.h,
                ),
                child: Row(
                  children: [
                    ConstantWidget.getTextWidget(
                      "Tent Size",
                      textColor,
                      TextAlign.start,
                      FontWeight.w500,
                      20.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Image.asset(
                        '${Constants.assetsImagePath}img_info.png',
                        width: 20.h,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              ConstantWidget.getVerSpace(12.h),
              SizedBox(
                width: screenWidth * 0.82,
                child: dropdownMenu(
                  items: tentSizes,
                  selectedValue: eventController.selectedSize,
                  buttonWidth: screenWidth * 0.82,
                  buttonPadding: 20,
                  onChanged: (val) {
                    final index = tentSizes.indexOf(val);
                    eventController.setSelectedSize(val, index);
                  },
                ),
              ),
              ConstantWidget.getVerSpace(48.h),
              SizedBox(
                width: double.infinity,
                child: getButton(
                  context,
                  primaryColor,
                  "Apply",
                  Colors.white,
                  () async {
                    if (eventController.sizeIndex == -1) {
                      Functions.showToast('This event don\'t have tent sizes.');
                    } else {
                      Navigator.of(context).pop();
                      eventController.applyEvents(
                        tentModels,
                        eventModel,
                        tentSizes,
                        (val) {
                          eventController.matchEngine!.currentItem?.superLike();
                          showSuccessDialog();
                        },
                      );
                    }
                  },
                  20.sp,
                  weight: FontWeight.w700,
                  buttonHeight: 58.h,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              ConstantWidget.getVerSpace(24.h),
            ],
          ),
        );
      },
    );
  }

  showVendorAlertSheet(
    UpComingEventsController eventController,
    BuildContext context,
  ) async {
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 48.h,
          ),
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              ConstantWidget.getVerSpace(8.h),
              Container(
                width: double.infinity,
                height: 8.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 120.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: borderColor,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 40.h,
                ),
                child: ConstantWidget.getTextWidget(
                  "Please complete your Vendor or Entertainment Profile to apply to Events.",
                  textColor,
                  TextAlign.center,
                  FontWeight.w400,
                  20.sp,
                  maxLines: 5,
                ),
              ),
              ConstantWidget.getVerSpace(48.h),
              SizedBox(
                width: double.infinity,
                child: getButton(
                  context,
                  primaryColor,
                  "Vendor Wizard",
                  Colors.white,
                  () async {},
                  20.sp,
                  weight: FontWeight.w700,
                  buttonHeight: 58.h,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              ConstantWidget.getVerSpace(24.h),
            ],
          ),
        );
      },
    );
  }

  showSuccessDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 196.h,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 24.h,
                      bottom: 12.h,
                    ),
                    child: const Center(
                      child: Text(
                        'Your apply to event completed successfully.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48.h,
                      margin: EdgeInsets.only(top: 12.h, bottom: 6.h),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
