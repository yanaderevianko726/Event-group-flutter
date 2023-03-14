// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/views/explore/create_group.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../controllers/groups/join_group_controller.dart';

class PeopleDetailsPage extends StatefulWidget {
  const PeopleDetailsPage({super.key});

  @override
  _PeopleDetailsPageWidget createState() => _PeopleDetailsPageWidget();
}

class _PeopleDetailsPageWidget extends State<PeopleDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder<JoinGroupController>(
      init: JoinGroupController(),
      builder: (joinGroupController) => Scaffold(
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
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 172.h,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2Fic_entertainment.png?alt=media&token=ec2797a6-85b9-4a94-a116-8bfc3d6f558f',
                          width: double.infinity,
                          height: 172.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 172.h,
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 12,
                        right: 12,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 4.0,
                              ),
                              child: ConstantWidget.getTextWidget(
                                'People Details',
                                Colors.white,
                                TextAlign.start,
                                FontWeight.w400,
                                28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ConstantWidget.getTextWidget(
                    'About Us',
                    textColor,
                    TextAlign.start,
                    FontWeight.w400,
                    22.sp,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstantWidget.getTextWidget(
                    'A couple cool girls looking for new friends!!! Would love to get ready for the party together  ',
                    descriptionColor,
                    TextAlign.start,
                    FontWeight.w400,
                    20.sp,
                    maxLines: 5,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ConstantWidget.getTextWidget(
                    'Interests',
                    textColor,
                    TextAlign.start,
                    FontWeight.w400,
                    22.sp,
                  ),
                ),
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
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(24.h),
                InkWell(
                  onTap: () {
                    showSuccessDialog();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 48,
                    margin: const EdgeInsets.only(top: 32),
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 44,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ConstantWidget.getTextWidget(
                            'Join Group',
                            Colors.white,
                            TextAlign.center,
                            FontWeight.w400,
                            20.sp,
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/ic_arrow_right_purple.png',
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSuccessDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 320,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_congrat.png',
                    width: 120,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 40.h,
                      bottom: 12.h,
                    ),
                    child: Center(
                      child: ConstantWidget.getTextWidget(
                        'Yay! Group Joined!',
                        blueLight,
                        TextAlign.center,
                        FontWeight.w500,
                        26.sp,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 48,
                      margin: const EdgeInsets.only(top: 24, bottom: 16),
                      decoration: BoxDecoration(
                        color: blueLight,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 44,
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: ConstantWidget.getTextWidget(
                              'View In Groups',
                              Colors.white,
                              TextAlign.center,
                              FontWeight.w400,
                              20.sp,
                              maxLines: 2,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/ic_arrow_right_purple.png',
                            width: 28,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
