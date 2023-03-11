// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:need_resume/need_resume.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';
import 'package:popuppros/routes/app_routes.dart';

import '../../controllers/events/home_event_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';
import 'create_event_page.dart';

class EventsHomeWidget extends StatefulWidget {
  const EventsHomeWidget({super.key});

  @override
  _EventsHomeWidget createState() => _EventsHomeWidget();
}

class _EventsHomeWidget extends ResumableState<EventsHomeWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeEventsController>(
      init: HomeEventsController(),
      builder: (homeEventController) => GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) => Container(
          width: screenWidth,
          height: double.infinity,
          color: bgDarkWhite,
          child: Column(
            children: [
              topAppBar(
                title: 'Events',
                icons: [
                  SizedBox(
                    width: 36.h,
                    height: 36.h,
                    child: notificationController.notificationCount > 0 ? Badge(
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
                    ) : Center(
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
                    icon: Icons.add_circle,
                    callback: () {
                      createNewEvent();
                    },
                  )
                ],
              ),
              ConstantWidget.getVerSpace(20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (homeEventController.hostingEvents.isNotEmpty)
                        Container(
                          width: screenWidth,
                          height: 48.h,
                          padding: EdgeInsets.only(right: 12.h, left: 12.h),
                          color: borderColor,
                          child: Row(
                            children: [
                              Expanded(
                                child: ConstantWidget.getTextWidget(
                                  'Event you are hosting',
                                  textColor,
                                  TextAlign.left,
                                  FontWeight.w500,
                                  20.sp,
                                  maxLines: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.eventsHostingAllRoute);
                                },
                                child: ConstantWidget.getTextWidget(
                                  'View All',
                                  primaryColor,
                                  TextAlign.left,
                                  FontWeight.w500,
                                  18.sp,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (homeEventController.hostingEvents.isNotEmpty)
                        for (var i = 0;
                            i < homeEventController.hostingEvents.length;
                            i++)
                          eventCell(
                            context,
                            homeEventController.hostingEvents[i],
                            i,
                            Colors.green[700]!,
                            () {
                              Get.toNamed(
                                AppRoutes.eventHostingViewRoute,
                                arguments: [
                                  homeEventController.hostingEvents[i]
                                ],
                              );
                            },
                          ),
                      if (homeEventController.approvedEvents.isNotEmpty)
                        Container(
                          width: screenWidth,
                          height: 48.h,
                          margin: EdgeInsets.only(top: 16.h),
                          padding: EdgeInsets.only(left: 12.h, right: 12.h),
                          color: borderColor,
                          child: Row(
                            children: [
                              Expanded(
                                child: ConstantWidget.getTextWidget(
                                  'Event you have been approved',
                                  textColor,
                                  TextAlign.left,
                                  FontWeight.w500,
                                  20.sp,
                                  maxLines: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.eventsApprovedAllRoute);
                                },
                                child: ConstantWidget.getTextWidget(
                                  'View All',
                                  primaryColor,
                                  TextAlign.left,
                                  FontWeight.w500,
                                  18.sp,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (homeEventController.approvedEvents.isNotEmpty)
                        for (var i = 0;
                            i < homeEventController.approvedEvents.length;
                            i++)
                          eventCell(
                            context,
                            homeEventController.approvedEvents[i].eventModel!,
                            i,
                            Colors.red[600]!,
                            () {
                              Get.toNamed(
                                AppRoutes.eventApprovedViewRoute,
                                arguments: [
                                  homeEventController.approvedEvents[i]
                                ],
                              );
                            },
                          ),
                      if (homeEventController.invitedEvents.isNotEmpty)
                        Container(
                          width: screenWidth,
                          height: 48.h,
                          margin: EdgeInsets.only(top: 16.h),
                          padding: EdgeInsets.only(right: 12.h, left: 12.h),
                          color: borderColor,
                          child: Row(
                            children: [
                              Expanded(
                                child: ConstantWidget.getTextWidget(
                                  'Event you have been invited',
                                  textColor,
                                  TextAlign.left,
                                  FontWeight.w500,
                                  20.sp,
                                  maxLines: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.eventsInvitedAllRoute);
                                },
                                child: ConstantWidget.getTextWidget(
                                  'View All',
                                  primaryColor,
                                  TextAlign.left,
                                  FontWeight.w500,
                                  18.sp,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (homeEventController.invitedEvents.isNotEmpty)
                        for (var i = 0;
                            i < homeEventController.invitedEvents.length;
                            i++)
                          inviteEventCell(
                            context,
                            homeEventController.invitedEvents[i],
                            i,
                            Colors.orange[500]!,
                            () {
                              Get.toNamed(
                                AppRoutes.eventInvitedViewRoute,
                                arguments: [
                                  homeEventController.invitedEvents[i]
                                ],
                              );
                            },
                          ),
                      ConstantWidget.getVerSpace(28.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createNewEvent() async {
    var response = await Get.to(() => const CreateEventPage());
    if (response) {
      setState(() {});
    }
  }
}
