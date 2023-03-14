// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';
import '../../../controllers/events/hosting/hosting_events_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';

class HostingEventsViewAll extends StatefulWidget {
  const HostingEventsViewAll({super.key});

  @override
  _EventsHostingWidget createState() => _EventsHostingWidget();
}

class _EventsHostingWidget extends State<HostingEventsViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<ExploreEventsController>(
          init: ExploreEventsController(),
          builder: (eventController) => GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (notificationController) => Container(
              height: double.infinity,
              width: double.infinity,
              color: bgDarkWhite,
              child: Column(
                children: [
                  topAppBar(
                    title: 'Events Hosting',
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
                  if (eventController.exploreEvents.isNotEmpty)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0;
                                i < eventController.exploreEvents.length;
                                i++)
                              eventsCell(
                                context: context,
                                eventModel: eventController.exploreEvents[i],
                                tagColor: Colors.green[700]!,
                                callback: () {
                                  Get.toNamed(
                                    AppRoutes.eventHostingViewRoute,
                                    arguments: [
                                      eventController.exploreEvents[i]
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
      backgroundColor: bgDark,
    );
  }
}
