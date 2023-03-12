// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/events/explore/explore_controller.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageWidget createState() => _ExplorePageWidget();
}

class _ExplorePageWidget extends State<ExplorePage> {
  final eventTitles = [
    'Sports',
    'Sports',
    'Sports',
    'Sports',
    'Sports',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      height: 180.h,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 220.h,
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                            width: double.infinity,
                            height: 56.h,
                            color: accentColor,
                            child: Row(
                              children: [
                                if (exploreController.eventTypes.isNotEmpty)
                                  for (var i = 0;
                                      i < exploreController.eventTypes.length;
                                      i++)
                                    Container(
                                      width: 100,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        color: exploreController
                                            .eventTypes[i].color
                                            .toColor(),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.add_chart,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                          ConstantWidget.getTextWidget(
                                            exploreController
                                                .eventTypes[i].color,
                                            Colors.white,
                                            TextAlign.center,
                                            FontWeight.w400,
                                            20.sp,
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
                  ],
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
