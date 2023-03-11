// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';
import '../../../controllers/events/approved/approved_events_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';

class ApprovedEventsViewAll extends StatefulWidget {
  const ApprovedEventsViewAll({super.key});

  @override
  _EventsApprovedWidget createState() => _EventsApprovedWidget();
}

class _EventsApprovedWidget extends State<ApprovedEventsViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<ApprovedEventsController>(
          init: ApprovedEventsController(),
          builder: (eventController) => GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (notificationController) => Container(
              height: double.infinity,
              width: double.infinity,
              color: bgDarkWhite,
              child: Column(
                children: [
                  topAppBar(
                    title: 'Events Approved',
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
                    ],
                    showBack: true,
                  ),
                  ConstantWidget.getVerSpace(20.h),
                  if (eventController.approvedEvents.isNotEmpty)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0;
                                i < eventController.approvedEvents.length;
                                i++)
                              eventsCell(
                                context: context,
                                eventModel: eventController.approvedEvents[i].eventModel!,
                                tagColor: Colors.red[600]!,
                                callback: () {
                                  Get.toNamed(
                                    AppRoutes.eventApprovedViewRoute,
                                    arguments: [
                                      eventController.approvedEvents[i]
                                    ],
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: bgDarkWhite,
    );
  }
}
