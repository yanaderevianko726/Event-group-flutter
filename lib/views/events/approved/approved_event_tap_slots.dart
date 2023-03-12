import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controllers/events/approved/approved_event_view_controller.dart';
import '../../../utils/widgets.dart';

class ApprovedEventTapSlots extends StatefulWidget {
  const ApprovedEventTapSlots({Key? key, }) : super(key: key);

  @override
  State<ApprovedEventTapSlots> createState() => _ApprovedEventTapSlots();
}

class _ApprovedEventTapSlots extends State<ApprovedEventTapSlots> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ApprovedEventViewController>(
      init: ApprovedEventViewController(),
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
              SizedBox(height: 24.h,),
            ],
          ),
        ),
      ),
    );
  }
}
