// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                                padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
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
                                            if (joinGroupController.tagModels.isNotEmpty)
                                              for (var i = 0;
                                              i < joinGroupController.tagModels.length;
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
                                                    borderRadius: const BorderRadius.all(
                                                      Radius.circular(40),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      eventTagImage(
                                                        icon:
                                                        '${joinGroupController.tagModels[i].icon}',
                                                      ),
                                                      Container(
                                                        margin:
                                                        EdgeInsets.only(left: 8.h),
                                                        child:
                                                        ConstantWidget.getTextWidget(
                                                          joinGroupController
                                                              .tagModels[i].title,
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
                                horizontal: 24.h,
                                vertical: 16.h,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    SizedBox(
                                      height: 12.h,
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
