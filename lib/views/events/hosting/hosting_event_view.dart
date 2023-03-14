// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/utils/constant_widgets.dart';
import 'package:popuppros/views/groups/join_group.dart';

import '../../../controllers/events/hosting/hosting_event_view_controller.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';

class HostingEventView extends StatefulWidget {
  const HostingEventView({super.key});

  @override
  _EventHostingViewWidget createState() => _EventHostingViewWidget();
}

class _EventHostingViewWidget extends State<HostingEventView> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HostingEventViewController>(
      init: HostingEventViewController(),
      builder: (eventViewController) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: bgDark,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: statusBarHeight,
                  color: pinkLightColor,
                ),
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    color: pinkLightColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        child: eventViewController
                                .eventModel.eventImage!.isNotEmpty
                            ? Image.network(
                                '${eventViewController.eventModel.eventImage}',
                                width: screenWidth,
                                height: 220,
                                fit: BoxFit.cover,
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: Constants.featuredEventHeight * 0.54,
                              ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, left: 12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: ConstantWidget.getTextWidget(
                                    '${eventViewController.eventModel.eventName}',
                                    Colors.white,
                                    TextAlign.start,
                                    FontWeight.w400,
                                    24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ConstantWidget.getTextWidget(
                    '${eventViewController.eventModel.eventName}',
                    textColor,
                    TextAlign.start,
                    FontWeight.w500,
                    28.sp,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 64.h,
                  margin: const EdgeInsets.only(top: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: purpleColor.withOpacity(0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: purpleColor,
                            size: 30,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 4.0),
                                child: ConstantWidget.getTextWidget(
                                  '${eventViewController.eventModel.eventDate}',
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ConstantWidget.getTextWidget(
                                  '${eventViewController.eventModel.eventTime}',
                                  descriptionColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 64.h,
                  margin: const EdgeInsets.only(top: 12.0),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: purpleColor.withOpacity(0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.location_on,
                            color: purpleColor,
                            size: 30,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 4.0),
                                child: ConstantWidget.getTextWidget(
                                  '${eventViewController.eventModel.addressLine1}',
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ConstantWidget.getTextWidget(
                                  '${eventViewController.eventModel.location}',
                                  descriptionColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52.h,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 48),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(35)),
                    border: Border.all(width: 0.8, color: purpleColor),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: ConstantWidget.getTextWidget(
                      'RSVP',
                      purpleColor,
                      TextAlign.start,
                      FontWeight.w400,
                      24.sp,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80.h,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child:
                            eventViewController.eventModel.userImage!.isNotEmpty
                                ? Image.network(
                                    '${eventViewController.eventModel.userImage}',
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                  )
                                : const SizedBox(
                                    width: 72,
                                    height: 72,
                                  ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(left: 12),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 4),
                                child: ConstantWidget.getTextWidget(
                                  '${eventViewController.eventModel.eventName}',
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  22.sp,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 6),
                                child: ConstantWidget.getTextWidget(
                                  'Organizer',
                                  descriptionColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  22.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstantWidget.getTextWidget(
                    'About Event',
                    textColor,
                    TextAlign.start,
                    FontWeight.w400,
                    24.sp,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: ConstantWidget.getTextWidget(
                    '${eventViewController.eventModel.description}',
                    descriptionColor,
                    TextAlign.start,
                    FontWeight.w400,
                    20.sp,
                    maxLines: 5,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const JoinGroupPage());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 80,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: ConstantWidget.getTextWidget(
                                  'Join \n Group',
                                  Colors.white,
                                  TextAlign.center,
                                  FontWeight.w400,
                                  20.sp,
                                  maxLines: 2,
                                ),
                              ),
                              Image.asset(
                                'assets/images/ic_arrow_right_purple.png',
                                width: 28,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 80,
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: ConstantWidget.getTextWidget(
                                'Create \n Group',
                                Colors.white,
                                TextAlign.center,
                                FontWeight.w400,
                                20.sp,
                                maxLines: 2,
                              ),
                            ),
                            Image.asset(
                              'assets/images/ic_arrow_right_purple.png',
                              width: 28,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
