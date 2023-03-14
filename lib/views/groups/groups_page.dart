// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../controllers/groups/groups_controller.dart';
import '../messages/messages_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  _GroupsPageWidget createState() => _GroupsPageWidget();
}

class _GroupsPageWidget extends State<GroupsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      init: GroupsController(),
      builder: (groupsController) => Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: bgDarkWhite,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 172.h,
                  decoration: BoxDecoration(
                    color: blueLight,
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
                        height: 64.h,
                        margin: EdgeInsets.only(left: 20.h, top: 28.h),
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 16.h,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 112,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: "#2F000000".toColor(),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2Fic_entertainment.png?alt=media&token=ec2797a6-85b9-4a94-a116-8bfc3d6f558f',
                                    width: 88,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      ConstantWidget.getTextWidget(
                                        'Is attending Popple Launch Party on ',
                                        descriptionColor,
                                        TextAlign.start,
                                        FontWeight.w400,
                                        18.sp,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: 88,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(25),
                                                ),
                                                color: blueLight,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ConstantWidget.getTextWidget(
                                                    'INFO',
                                                    Colors.white,
                                                    TextAlign.start,
                                                    FontWeight.w400,
                                                    18.sp,
                                                  ),
                                                  const SizedBox(width: 6,),
                                                  Image.asset(
                                                    'assets/images/ic_arrow_right_purple.png',
                                                    width: 20,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Get.to(() => const MessagesPage());
                                            },
                                            child: Container(
                                              width: 88,
                                              height: 30,
                                              margin:
                                                  const EdgeInsets.only(left: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(25),
                                                ),
                                                border: Border.all(
                                                  width: 0.7,
                                                  color: primaryColor,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ConstantWidget.getTextWidget(
                                                    'CHAT',
                                                    primaryColor,
                                                    TextAlign.start,
                                                    FontWeight.w400,
                                                    18.sp,
                                                  ),
                                                  const SizedBox(width: 6,),
                                                  Image.asset(
                                                    'assets/images/ic_blue_right.png',
                                                    width: 20,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
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
            child: groupsController.isLoading
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
    );
  }
}
