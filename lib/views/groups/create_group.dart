// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/constant_widgets.dart';
import '../../../utils/my_colors.dart';
import '../../controllers/groups/join_group_controller.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  _CreateGroupPageWidget createState() => _CreateGroupPageWidget();
}

class _CreateGroupPageWidget extends State<CreateGroupPage> {
  TextEditingController bioController = TextEditingController();

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
                  color: primaryColor,
                ),
                Container(
                  width: double.infinity,
                  height: 100.h,
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 12,
                    right: 12,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
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
                            'Create Group',
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
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ConstantWidget.getTextWidget(
                      'Build your group to attend XX Launch party.',
                      textColor,
                      TextAlign.start,
                      FontWeight.w400,
                      18.sp,
                      maxLines: 2),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ConstantWidget.getTextWidget(
                    'Select the size',
                    textColor,
                    TextAlign.start,
                    FontWeight.w400,
                    20.sp,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 86,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 36, right: 4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 64,
                            child: ConstantWidget.getTextWidget(
                              'From',
                              textColor,
                              TextAlign.start,
                              FontWeight.w400,
                              18.sp,
                            ),
                          ),
                          Container(
                            width: 64,
                            margin: const EdgeInsets.only(top: 12),
                            child: ConstantWidget.getTextWidget(
                              '3',
                              textColor,
                              TextAlign.start,
                              FontWeight.w500,
                              28.sp,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: textColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 64,
                            child: ConstantWidget.getTextWidget(
                              'To',
                              textColor,
                              TextAlign.start,
                              FontWeight.w400,
                              18.sp,
                            ),
                          ),
                          Container(
                            width: 64,
                            margin: const EdgeInsets.only(top: 12),
                            child: ConstantWidget.getTextWidget(
                              '3',
                              textColor,
                              TextAlign.start,
                              FontWeight.w500,
                              28.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(16.h),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    children: [
                      ConstantWidget.getTextWidget(
                        'Select the Interest',
                        textColor,
                        TextAlign.start,
                        FontWeight.w400,
                        20.sp,
                      ),
                      const Spacer(),
                      ConstantWidget.getTextWidget(
                        'See All',
                        textColor,
                        TextAlign.start,
                        FontWeight.w400,
                        18.sp,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 112,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(width: 0.8, color: primaryColor),
                        ),
                        child: Center(
                          child: ConstantWidget.getTextWidget(
                            'Games Online',
                            primaryColor,
                            TextAlign.center,
                            FontWeight.w400,
                            18.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 32,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(width: 0.8, color: primaryColor),
                        ),
                        child: Center(
                          child: ConstantWidget.getTextWidget(
                            'Concert',
                            primaryColor,
                            TextAlign.center,
                            FontWeight.w400,
                            18.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 32,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(width: 0.8, color: primaryColor),
                        ),
                        child: Center(
                          child: ConstantWidget.getTextWidget(
                            'Movies',
                            primaryColor,
                            TextAlign.center,
                            FontWeight.w400,
                            18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(width: 0.8, color: primaryColor),
                        ),
                        child: Center(
                          child: ConstantWidget.getTextWidget(
                            'Others',
                            primaryColor,
                            TextAlign.center,
                            FontWeight.w400,
                            18.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 32,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(width: 0.8, color: primaryColor),
                        ),
                        child: Center(
                          child: ConstantWidget.getTextWidget(
                            'Concert',
                            primaryColor,
                            TextAlign.center,
                            FontWeight.w400,
                            18.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 32,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(width: 0.8, color: primaryColor),
                        ),
                        child: Center(
                          child: ConstantWidget.getTextWidget(
                            'Movies',
                            primaryColor,
                            TextAlign.center,
                            FontWeight.w400,
                            18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(16.h),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ConstantWidget.getTextWidget(
                    'Add a bio',
                    textColor,
                    TextAlign.start,
                    FontWeight.w400,
                    20.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ConstantWidget.getDescTextFiledWithLabel(
                    context,
                    "",
                    bioController,
                    isEnable: false,
                    height: 40.h,
                    validator: (services) {
                      if (services == null || services.isEmpty) {
                        return 'Please enter a bio';
                      }
                      return null;
                    },
                    minLines: true,
                    maxLine: 3,
                  ),
                ),
                ConstantWidget.getVerSpace(16.h),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ConstantWidget.getTextWidget(
                    'Copy join link',
                    textColor,
                    TextAlign.start,
                    FontWeight.w400,
                    20.sp,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {},
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
                            'Create',
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
}
