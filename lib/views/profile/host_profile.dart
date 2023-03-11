import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';

import '../../controllers/user/host_profile_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class HostProfilePage extends StatefulWidget {
  const HostProfilePage({Key? key}) : super(key: key);

  @override
  State<HostProfilePage> createState() => _HostProfilePage();
}

class _HostProfilePage extends State<HostProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HostProfileController>(
      init: HostProfileController(),
      builder: (hostProfileController) => GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) => Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  topAppBar(
                    title: 'Host Profile',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
