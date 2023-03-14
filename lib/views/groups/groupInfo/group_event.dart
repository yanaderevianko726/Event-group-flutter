import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';

class GroupEventDetails extends StatefulWidget {
  const GroupEventDetails({Key? key}) : super(key: key);

  @override
  State<GroupEventDetails> createState() => _GroupEventDetailsState();
}

class _GroupEventDetailsState extends State<GroupEventDetails> {
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
              'Popple Launch Party 😁',
              textColor,
              TextAlign.start,
              FontWeight.w400,
              26.sp,
            ),
          ),
          Container(
            width: double.infinity,
            height: 64.h,
            margin: const EdgeInsets.only(top: 16.0),
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
                            '13 April, 2023',
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
                            'Wonderland House',
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
                            '36 Guild Street Boston, MA ',
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
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2FScreen%20Shot%202023-02-13%20at%2010.49%201.png?alt=media&token=3b27cfa9-9d7a-45dd-a553-45e44a29b992',
                      width: 72,
                      height: 72,
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
                            'Popple Marketing Team',
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
                            'Organizer',
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
              'About Event',
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
              'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
              descriptionColor,
              TextAlign.start,
              FontWeight.w400,
              18.sp,
              maxLines: 5,
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
