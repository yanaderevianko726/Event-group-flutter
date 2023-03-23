import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/explore/explore_event_view_controller.dart';
import '../../../utils/widgets.dart';

class HostingEventTapVendors extends StatefulWidget {
  const HostingEventTapVendors({
    Key? key,
  }) : super(key: key);

  @override
  State<HostingEventTapVendors> createState() => _HostingEventTapVendors();
}

class _HostingEventTapVendors extends State<HostingEventTapVendors> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ExploreEventViewController>(
      init: ExploreEventViewController(),
      builder: (eventController) => Container(
        width: screenWidth,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: getCustomText(
                  'Approved Vendors',
                  Colors.black87,
                  1,
                  TextAlign.start,
                  FontWeight.w400,
                  20.sp,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
