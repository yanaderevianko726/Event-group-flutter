// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/my_colors.dart';
import '../../controllers/groups/group_info_controller.dart';
import '../../utils/constant_widgets.dart';
import 'groupInfo/group_event.dart';
import 'groupInfo/group_info.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({super.key});

  @override
  _GroupInfoPageWidget createState() => _GroupInfoPageWidget();
}

class _GroupInfoPageWidget extends State<GroupInfoPage> {
  int tapIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double topBtnWidth = MediaQuery.of(context).size.width * 0.35;
    return GetBuilder<GroupInfoController>(
      init: GroupInfoController(),
      builder: (groupInfoController) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: bgDarkWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: pinkLightColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/people-olyvia.appspot.com/o/users%2Fic_entertainment.png?alt=media&token=ec2797a6-85b9-4a94-a116-8bfc3d6f558f',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 64,
                        margin: EdgeInsets.only(left: 20, top: statusBarHeight + 20),
                        child: ConstantWidget.getTextWidget(
                          'My People',
                          textColor,
                          TextAlign.start,
                          FontWeight.w500,
                          28.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: topBtnWidth * 2 + 20,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: "#2F000000".toColor(),
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      )
                    ],
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            tapIndex = 0;
                          });
                        },
                        child: Container(
                          width: topBtnWidth,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: tapIndex == 0 ? Colors.white: Colors.grey.withOpacity(0.1),
                          ),
                          child: Center(
                            child: ConstantWidget.getTextWidget(
                              'GROUP',
                              tapIndex == 0 ? primaryColor: tag3Color,
                              TextAlign.start,
                              FontWeight.w400,
                              18.sp,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tapIndex = 1;
                          });
                        },
                        child: Container(
                          width: topBtnWidth,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: tapIndex == 1 ? Colors.white: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: ConstantWidget.getTextWidget(
                              'EVENT',
                              tapIndex == 1 ? primaryColor: tag3Color,
                              TextAlign.start,
                              FontWeight.w400,
                              18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                tapIndex == 0
                    ? const GroupInfoDetail()
                    : const GroupEventDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
