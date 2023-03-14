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
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ConstantWidget.getTextWidget(
              'Just the Girls 🥰🥰',
              textColor,
              TextAlign.start,
              FontWeight.w400,
              26.sp,
            ),
          ),
          Container(
            width: double.infinity,
            height: 64.h,
            margin: const EdgeInsets.only(top: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    child: Image.asset(
                      'assets/images/ic_user.png',
                      color: purpleColor,
                      width: 30,
                      fit: BoxFit.cover,
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
                            '14 December, 2021',
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
                            'Tuesday, 4:00PM - 9:00PM',
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
            margin: const EdgeInsets.only(top: 16),
            child: ConstantWidget.getTextWidget(
              'About Us',
              textColor,
              TextAlign.start,
              FontWeight.w400,
              24.sp,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: double.infinity,
            child: ConstantWidget.getTextWidget(
              'A couple cool girls looking for new friends!!! Would love to get ready for the party together  ',
              descriptionColor,
              TextAlign.start,
              FontWeight.w400,
              18.sp,
              maxLines: 5,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            child: ConstantWidget.getTextWidget(
              'Interests',
              textColor,
              TextAlign.start,
              FontWeight.w400,
              24.sp,
            ),
          ),
          ConstantWidget.getVerSpace(12.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  width: 72,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(25)),
                    color: tag1Color,
                  ),
                  child: Center(
                    child: ConstantWidget.getTextWidget(
                      'Concert',
                      Colors.white,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                    ),
                  ),
                ),
                Container(
                  width: 64,
                  height: 26,
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(25)),
                    color: tag2Color,
                  ),
                  child: Center(
                    child: ConstantWidget.getTextWidget(
                      'Movies',
                      Colors.white,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                    ),
                  ),
                ),
                Container(
                  width: 68,
                  height: 26,
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(25)),
                    color: tag3Color,
                  ),
                  child: Center(
                    child: ConstantWidget.getTextWidget(
                      'Fashion',
                      Colors.white,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 26,
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(25)),
                    color: tag4Color,
                  ),
                  child: Center(
                    child: ConstantWidget.getTextWidget(
                      'Art',
                      Colors.white,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            child: ConstantWidget.getTextWidget(
              'Members',
              textColor,
              TextAlign.start,
              FontWeight.w400,
              24.sp,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2FScreen%20Shot%202023-02-13%20at%2010.49%201.png?alt=media&token=3b27cfa9-9d7a-45dd-a553-45e44a29b992',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2FMask%20Group.png?alt=media&token=9f82676e-8dc3-4b0c-a378-26a0e867d7f4',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2FMask%20Group%20(1).png?alt=media&token=caa7beb7-079d-4f01-8dbb-c42f7d07c580',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 48,
            margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                width: 0.8,
                color: tag3Color,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 44,),
                const Spacer(),
                ConstantWidget.getTextWidget(
                  'LEAVE GROUP',
                  tag3Color,
                  TextAlign.center,
                  FontWeight.w400,
                  20.sp,
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/ic_red_arrow_right.png',
                  width: 32,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(width: 12,),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
