import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/routes/app_routes.dart';

import '../../../controllers/events/hosting/hosting_event_view_controller.dart';
import '../../../utils/my_colors.dart';
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
    return GetBuilder<HostingEventViewController>(
      init: HostingEventViewController(),
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
                height: 12.h,
              ),
              if (eventController.tentVendors.isNotEmpty)
                for (var j = 0; j < eventController.tentVendors.length; j++)
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        if (eventController.tentVendors[j].vendors.isNotEmpty)
                          for (var i = 0;
                              i < eventController.tentVendors[j].vendors.length;
                              i++)
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.appliedVendorViewRoute,
                                    arguments: [
                                      eventController.tentVendors[j].vendors[i],
                                      eventController.eventModel,
                                    ]);
                              },
                              child: approvedVendorWidget(
                                userDetail: eventController.userDetail,
                                vendorModel:
                                    eventController.tentVendors[j].vendors[i],
                                eventModel: eventController.eventModel,
                              ),
                            ),
                      ],
                    ),
                  ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.browseVendorsRoute, arguments: [
                        eventController.eventModel,
                      ]);
                    },
                    child: getCustomText(
                      '+ Invite Vendors',
                      primaryLightColor,
                      1,
                      TextAlign.start,
                      FontWeight.w400,
                      20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 16.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
