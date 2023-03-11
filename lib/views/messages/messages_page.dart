import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/utils/constants.dart';

import '../../controllers/messages/messages_controller.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Widget> topIcons = [];

  initTopIcons() {
    Widget alert = Icon(
      Icons.call,
      color: primaryLightColor,
      size: 28.h,
    );
    topIcons.add(alert);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initTopIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagesController>(
      init: MessagesController(),
      builder: (messagesController) => Scaffold(
        backgroundColor: bgDark,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: bgDarkWhite,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: "#2F000000".toColor(),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ]),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 80.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            for (var i = 0; i < topIcons.length; i++)
                              Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: topIcons.elementAt(i),
                              ),
                            SizedBox(
                              width: 16.w,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 12.w,
                                margin: EdgeInsets.only(left: 12.h),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 28.h,
                                  color: textColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.h,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: messagesController
                                      .channelModel.otherImage!.isNotEmpty
                                  ? Image.network(
                                      '${messagesController.channelModel.otherImage}',
                                      width: 56.h,
                                      height: 56.h,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "${Constants.assetsImagePath}profile_imge.png",
                                      width: 60.h,
                                      height: 60.h,
                                    ),
                            ),
                            SizedBox(
                              width: 12.h,
                            ),
                            getCustomText(
                              '${messagesController.channelModel.otherName}.',
                              Colors.black87.withOpacity(0.7),
                              1,
                              TextAlign.start,
                              FontWeight.w400,
                              18.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ConstantWidget.getVerSpace(10.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.h,
                    ),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          if (messagesController.messageModels.isNotEmpty)
                            for (var i = 0;
                                i < messagesController.messageModels.length;
                                i++)
                              messagesController.messageModels[i].messageCell(
                                context: context,
                                userDetail: messagesController.userDetail,
                                onClickCell: () {},
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: borderColor,
                            ),
                            child: ConstantWidget.getMessageTextFiled(
                              context,
                              "Type a message",
                              messagesController.messageTxtController,
                              isEnable: false,
                              maxLine: 5,
                              minLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.h,
                        ),
                        InkWell(
                          onTap: () {
                            messagesController.onClickSend();
                          },
                          child: Container(
                            width: 56.h,
                            height: 56.h,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: borderColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Center(
                                child: Image.asset(
                                  '${Constants.assetsImagePath}ic_send.png',
                                ),
                              ),
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
    );
  }
}
