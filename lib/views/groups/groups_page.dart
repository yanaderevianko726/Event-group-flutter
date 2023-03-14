// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/routes/app_routes.dart';
import '../../../controllers/events/explore/explore_controller.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  _GroupsPageWidget createState() => _GroupsPageWidget();
}

class _GroupsPageWidget extends State<GroupsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ExploreController>(
      init: ExploreController(),
      builder: (exploreController) => Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: bgDarkWhite,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 212.h,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.5,
                            height: 64.h,
                            margin: EdgeInsets.only(left: 24.h, top: 8.h),
                            child: Image.asset(
                              'assets/images/ic_people.png',
                              width: screenWidth * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60.h,
                            margin: EdgeInsets.only(
                              left: 24.h,
                              top: 12.h,
                              right: 24.h,
                            ),
                            padding: EdgeInsets.only(
                              left: 8.h,
                              right: 8.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.8,
                                color: disabledColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: ConstantWidget.getTextWidget(
                                      'Search',
                                      Colors.white,
                                      TextAlign.start,
                                      FontWeight.w400,
                                      20.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 112.h,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                    color: purpleDarkColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: Image.asset(
                                          'assets/images/ic_filter.png',
                                          width: 24,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: ConstantWidget.getTextWidget(
                                          'Filter',
                                          Colors.white,
                                          TextAlign.center,
                                          FontWeight.w400,
                                          18.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 232.h,
                      child: Column(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: 56.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12.h,
                                  ),
                                  if (exploreController.tagModels.isNotEmpty)
                                    for (var i = 0;
                                    i < exploreController.tagModels.length;
                                    i++)
                                      Container(
                                        width: 100,
                                        height: 56.h,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(
                                            int.parse(
                                              "0x${exploreController.tagModels[i].color}",
                                            ),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(40),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            eventTagImage(
                                              icon:
                                              '${exploreController.tagModels[i].icon}',
                                            ),
                                            Container(
                                              margin:
                                              EdgeInsets.only(left: 8.h),
                                              child:
                                              ConstantWidget.getTextWidget(
                                                exploreController
                                                    .tagModels[i].title,
                                                Colors.white,
                                                TextAlign.center,
                                                FontWeight.w400,
                                                18.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  SizedBox(
                                    width: 12.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 24.h,
                      vertical: 16.h,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (exploreController.tagModels.isNotEmpty)
                            Row(
                              children: [
                                ConstantWidget.getTextWidget(
                                  'Featured',
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  20.sp,
                                ),
                                const Spacer(),
                                ConstantWidget.getTextWidget(
                                  'All',
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  20.sp,
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: textColor,
                                  size: 22,
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: Constants.featuredEventHeight + 10,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  if (exploreController
                                      .featuredEvents.isNotEmpty)
                                    for (var i = 0;
                                    i <
                                        exploreController
                                            .featuredEvents.length;
                                    i++)
                                      exploreController.featuredEvents[i]
                                          .featuredWidget(context, () {
                                        Get.toNamed(
                                            AppRoutes.eventHostingViewRoute,
                                            arguments: [
                                              exploreController
                                                  .featuredEvents[i]
                                            ]);
                                      }),
                                  SizedBox(
                                    width: 12.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                'Upcoming Events',
                                textColor,
                                TextAlign.start,
                                FontWeight.w400,
                                20.sp,
                              ),
                              const Spacer(),
                              ConstantWidget.getTextWidget(
                                'All',
                                textColor,
                                TextAlign.start,
                                FontWeight.w400,
                                20.sp,
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: textColor,
                                size: 22,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          if (exploreController.eventModels.isNotEmpty)
                            for (var i = 0;
                            i < exploreController.eventModels.length;
                            i++)
                              exploreController.eventModels[i]
                                  .eventWidget(context, () {}),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: exploreController.isLoading
                ? Center(
              child: CircularProgressIndicator(
                color: primaryLightColor,
                backgroundColor: const Color(0x0F000000),
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}
