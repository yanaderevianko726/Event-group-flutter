// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/models/invite_event_model.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../controllers/events/invited/invited_events_controller.dart';
import '../../../controllers/notifications/notification_controller.dart';
import '../../../models/event_model.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';

class InvitedEventsViewAll extends StatefulWidget {
  const InvitedEventsViewAll({super.key});

  @override
  _EventsInvitedWidget createState() => _EventsInvitedWidget();
}

class _EventsInvitedWidget extends State<InvitedEventsViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<InvitedEventsController>(
          init: InvitedEventsController(),
          builder: (inviteController) => GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (notificationController) => Container(
              height: double.infinity,
              width: double.infinity,
              color: bgDarkWhite,
              child: Column(
                children: [
                  topAppBar(
                    title: 'Events Invited',
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
                  if (inviteController.swipeItems.isNotEmpty)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 10.h,
                        ),
                        child: SwipeCards(
                          matchEngine: inviteController.matchEngine!,
                          itemBuilder: (BuildContext context, int index) {
                            InviteEventModel ev = inviteController
                                .swipeItems[index].content as InviteEventModel;
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
                              child: inviteSwipeCell(
                                context: context,
                                eventModel: ev,
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
                                  "item: ${item.content.username}, index: $index");
                            }
                          },
                          leftSwipeAllowed: true,
                          rightSwipeAllowed: true,
                        ),
                      ),
                    ),
                  ConstantWidget.getVerSpace(12.h),
                  if (inviteController.swipeItems.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h,
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (inviteController.swipeItems.isNotEmpty)
                              swipeBottomButton(
                                image:
                                    '${Constants.assetsImagePath}ic_refresh.png',
                                onClick: () {
                                  inviteController.matchEngine!.currentItem
                                      ?.nope();
                                },
                              ),
                            if (inviteController.swipeItems.isNotEmpty)
                              swipeBottomButton(
                                width: 68,
                                imgRate: 0.55,
                                bgColor: Colors.green,
                                image: '${Constants.assetsImagePath}155884.png',
                                onClick: () {
                                  Get.toNamed(
                                    AppRoutes.eventInvitedViewRoute,
                                    arguments: [
                                      inviteController.matchEngine!.currentItem!.content
                                    ],
                                  );
                                  inviteController.matchEngine!.currentItem
                                      ?.superLike();
                                },
                              ),
                            if (inviteController.swipeItems.isNotEmpty)
                              swipeBottomButton(
                                image:
                                    '${Constants.assetsImagePath}ic_star.png',
                                onClick: () {
                                  inviteController.matchEngine!.currentItem
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
          ),
        ),
      ),
      backgroundColor: bgDarkWhite,
    );
  }
}
