import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';

class GroupInfoDetail extends StatefulWidget {
  const GroupInfoDetail({Key? key}) : super(key: key);

  @override
  State<GroupInfoDetail> createState() => _GroupInfoDetailState();
}

class _GroupInfoDetailState extends State<GroupInfoDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 172,
          decoration: BoxDecoration(
            color: pinkLightColor,
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
                width: double.infinity,
                height: 64,
                margin: EdgeInsets.only(left: 20, top: 28),
                child: ConstantWidget.getTextWidget(
                  'My People',
                  Colors.white,
                  TextAlign.start,
                  FontWeight.w500,
                  28.sp,
                ),
              ),
              Container(
                width: double.infinity,
                height: 60.h,
                margin: EdgeInsets.only(
                  left: 16.h,
                  right: 16.h,
                ),
                padding: EdgeInsets.only(
                  left: 8.h,
                  right: 8.h,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
