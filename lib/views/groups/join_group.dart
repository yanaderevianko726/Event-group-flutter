// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/views/groups/people_details.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../controllers/groups/join_group_controller.dart';

class JoinGroupPage extends StatefulWidget {
  const JoinGroupPage({super.key});

  @override
  _JoinGroupPageWidget createState() => _JoinGroupPageWidget();
}

class _JoinGroupPageWidget extends State<JoinGroupPage> {
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: statusBarHeight,
                color: blueLight,
              ),
              Expanded(
                child: Stack(
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
                                height: 172.h,
                                padding: const EdgeInsets.only(
                                    top: 16, left: 12, right: 12),
                                decoration: BoxDecoration(
                                  color: blueLight,
                                  borderRadius: const BorderRadius.only(
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
                                          'Peoples',
                                          Colors.white,
                                          TextAlign.start,
                                          FontWeight.w400,
                                          28.sp,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 108.h,
                                      height: 44.h,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                        color: blueDark,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Image.asset(
                                              'assets/images/ic_filter.png',
                                              width: 24,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
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
                              SizedBox(
                                width: double.infinity,
                                height: 186.h,
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
                                            if (joinGroupController
                                                .tagModels.isNotEmpty)
                                              for (var i = 0;
                                                  i <
                                                      joinGroupController
                                                          .tagModels.length;
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
                                                        "0x${joinGroupController.tagModels[i].color}",
                                                      ),
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(40),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      eventTagImage(
                                                        icon:
                                                            '${joinGroupController.tagModels[i].icon}',
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 8.h),
                                                        child: ConstantWidget
                                                            .getTextWidget(
                                                          joinGroupController
                                                              .tagModels[i]
                                                              .title,
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
                                horizontal: 12.h,
                                vertical: 16.h,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const PeopleDetailsPage());
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 120,
                                        margin: const EdgeInsets.all(6.0),
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.15),
                                              blurRadius: 3,
                                              offset: const Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 88,
                                              height: 88,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                color: pinkLightColor,
                                              ),
                                              child: Center(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12.0),
                                                  child: Image.network(
                                                    'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2Fic_fire.png?alt=media&token=b4b7f535-0af4-40f4-9697-a4fe820e7ea4',
                                                    width: 52,
                                                    height: 52,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(
                                                    left: 8, right: 8, top: 6),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ConstantWidget.getTextWidget(
                                                      'Just the Girls 🥰🥰',
                                                      textColor,
                                                      TextAlign.start,
                                                      FontWeight.w400,
                                                      22.sp,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1),
                                                      child: ConstantWidget.getTextWidget(
                                                        'A couple cool girls looking for new friends!!! Would love to get ready together  ',
                                                        descriptionColor,
                                                        TextAlign.start,
                                                        FontWeight.w400,
                                                        18.sp,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3,),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 72,
                                                          height: 26,
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                                                            color: tag1Color,
                                                          ),
                                                          child: Center(
                                                            child:
                                                            ConstantWidget.getTextWidget(
                                                              'Concert',
                                                              Colors.white,
                                                              TextAlign.start,
                                                              FontWeight.w400,
                                                              18.sp,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 38,
                                                          height: 26,
                                                          margin: const EdgeInsets.only(left: 6),
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                                                            color: tag2Color,
                                                          ),
                                                          child: Center(
                                                            child:
                                                            ConstantWidget.getTextWidget(
                                                              'Art',
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
                                                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                                                            color: tag3Color,
                                                          ),
                                                          child: Center(
                                                            child:
                                                            ConstantWidget.getTextWidget(
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const PeopleDetailsPage());
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 120,
                                        margin: const EdgeInsets.all(6.0),
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.15),
                                              blurRadius: 3,
                                              offset: const Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 88,
                                              height: 88,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                                color: pinkLightColor,
                                              ),
                                              child: Center(
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(12.0),
                                                  child: Image.network(
                                                    'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2Fic_entertainment.png?alt=media&token=ec2797a6-85b9-4a94-a116-8bfc3d6f558f',
                                                    width: 88,
                                                    height: 88,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(
                                                    left: 8, right: 8, top: 6),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    ConstantWidget.getTextWidget(
                                                      'Just the Girls 🥰🥰',
                                                      textColor,
                                                      TextAlign.start,
                                                      FontWeight.w400,
                                                      22.sp,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1),
                                                      child: ConstantWidget.getTextWidget(
                                                        'A couple cool girls looking for new friends!!! Would love to get ready together  ',
                                                        descriptionColor,
                                                        TextAlign.start,
                                                        FontWeight.w400,
                                                        18.sp,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3,),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 26,
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                                                            color: tag4Color,
                                                          ),
                                                          child: Center(
                                                            child:
                                                            ConstantWidget.getTextWidget(
                                                              'Video Games',
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
                                                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                                                            color: tag2Color,
                                                          ),
                                                          child: Center(
                                                            child:
                                                            ConstantWidget.getTextWidget(
                                                              'Anime',
                                                              Colors.white,
                                                              TextAlign.start,
                                                              FontWeight.w400,
                                                              18.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: joinGroupController.isLoading
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
