import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/routes/app_routes.dart';

import '../../../controllers/events/hosting/hosting_event_view_controller.dart';
import '../../../utils/widgets.dart';

class HostingEventTapMessages extends StatefulWidget {
  const HostingEventTapMessages({
    Key? key,
  }) : super(key: key);

  @override
  State<HostingEventTapMessages> createState() => _EventHostingMessagesView();
}

class _EventHostingMessagesView extends State<HostingEventTapMessages> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HostingEventViewController>(
      init: HostingEventViewController(),
      builder: (eventController) => Container(
        width: screenWidth,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              if (eventController.channels.isNotEmpty)
                for (var i = 0; i < eventController.channels.length; i++)
                  approvedMessageCell(
                    messageChannelModel: eventController.channels[i],
                    callback: () {
                      Get.toNamed(
                        AppRoutes.messagesPageRoute,
                        arguments: [
                          eventController.eventModel.eventId,
                          eventController.channels[i]
                        ],
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
