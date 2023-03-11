import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/routes/app_routes.dart';

import '../../../controllers/events/approved/approved_event_view_controller.dart';
import '../../../utils/widgets.dart';

class ApprovedEventTapMessages extends StatefulWidget {
  const ApprovedEventTapMessages({
    Key? key,
  }) : super(key: key);

  @override
  State<ApprovedEventTapMessages> createState() => _ApprovedEventTapMessages();
}

class _ApprovedEventTapMessages extends State<ApprovedEventTapMessages> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ApprovedEventViewController>(
      init: ApprovedEventViewController(),
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
                          eventController
                              .approvedEventModel.eventModel!.eventId,
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
