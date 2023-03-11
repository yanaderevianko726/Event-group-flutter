// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/notification_controller.dart';
import 'package:popuppros/views/events/invited/invited_event_tap_slots.dart';

import '../../../controllers/events/invited/invited_event_view_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/my_colors.dart';
import '../../../models/event_tap.dart';
import '../hosting/hosting_event_view.dart';
import 'invited_event_tap_details.dart';

class InvitedEventView extends StatefulWidget {
  const InvitedEventView({super.key});

  @override
  _InvitedEventView createState() => _InvitedEventView();
}

class _InvitedEventView extends State<InvitedEventView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<EventTap> _pages = [
    EventTap(
      'Details',
      const InvitedEventTapDetails(),
      const Icon(Icons.video_library),
    ),
    EventTap(
      'Slots',
      const InvitedEventTapSlots(),
      const Icon(Icons.image),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double topImgHeight = 280.h;
    return GetBuilder<InvitedEventViewController>(
      init: InvitedEventViewController(),
      builder: (eventViewController) => GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (notificationController) => Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: bgDark,
          body: SafeArea(
            child: Container(
              width: screenWidth,
              height: double.infinity,
              color: bgDarkWhite,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool scrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: primaryLightColor,
                      expandedHeight: topImgHeight,
                      floating: true,
                      pinned: true,
                      snap: true,
                      forceElevated: true,
                      elevation: 1,
                      title: Text(
                        '${eventViewController.inviteEventModel.venueName}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      actions: <Widget>[
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
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: const Text(''),
                        background: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: topImgHeight,
                              child: eventViewController
                                      .inviteEventModel.image!.isNotEmpty
                                  ? Image.network(
                                      '${eventViewController.inviteEventModel.image}',
                                      width: screenWidth,
                                      height: topImgHeight,
                                      fit: BoxFit.cover,
                                    )
                                  : SizedBox(
                                      width: screenWidth,
                                      height: topImgHeight,
                                    ),
                            ),
                            Container(
                              width: double.infinity,
                              height: topImgHeight,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Colors.black.withOpacity(0.4),
                                    Colors.black.withOpacity(0.2),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: SliverPersistentHeaderDelegateImpl(
                        tabBar: TabBar(
                          labelColor: primaryLightColor,
                          unselectedLabelColor: textColor,
                          indicatorColor: primaryLightColor,
                          controller: tabController,
                          tabs: _pages
                              .map<Tab>(
                                  (EventTap page) => Tab(text: page.title))
                              .toList(),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: tabController,
                  children:
                      _pages.map<Widget>((EventTap page) => page.body).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
