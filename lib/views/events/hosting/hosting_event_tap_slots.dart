import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controllers/explore/explore_event_view_controller.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets.dart';

class HostingEventTapSlots extends StatefulWidget {
  const HostingEventTapSlots({
    Key? key,
  }) : super(key: key);

  @override
  State<HostingEventTapSlots> createState() => _EventHostingSlotsView();
}

class _EventHostingSlotsView extends State<HostingEventTapSlots> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ExploreEventViewController>(
      init: ExploreEventViewController(),
      builder: (eventController) => Container(
        width: screenWidth,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomText(
                'Available Slots',
                Colors.black87,
                1,
                TextAlign.start,
                FontWeight.w400,
                20.sp,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      addTentSlot(context, eventController);
                    },
                    child: getCustomText(
                      '+ Add Slot',
                      primaryLightColor,
                      1,
                      TextAlign.start,
                      FontWeight.w400,
                      20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  addTentSlot(BuildContext context, ExploreEventViewController eventController) {

  }
}
