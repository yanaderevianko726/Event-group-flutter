import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/notification_model.dart';
import 'package:popuppros/views/notifications/noti_event_view.dart';

import '../../controllers/notifications/notification_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (notificationController) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: bgDark,
        body: SafeArea(
          child: SizedBox(
            width: screenWidth,
            height: double.infinity,
            child: Column(
              children: [
                topAppBar(
                  title: 'Notifications',
                  icons: [],
                  showBack: true,
                ),
                ConstantWidget.getVerSpace(12.h),
                if (notificationController.notifications.isNotEmpty)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Column(
                          children: [
                            for (var i = 0;
                                i < notificationController.notifications.length;
                                i++)
                              notificationUI(
                                notification:
                                    notificationController.notifications[i],
                                onClick: () {
                                  onClickNotification(notificationController, notificationController.notifications, i);
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onClickNotification(NotificationController notificationController, List<NotificationModel> notifications, int index) {
    notificationController.setRead(index, (){
      Get.to(() => NotiEventViewPage(notificationModel: notifications[index],));
    });
  }
}
