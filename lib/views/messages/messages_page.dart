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
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder<MessagesController>(
      init: MessagesController(),
      builder: (messagesController) => Scaffold(
        backgroundColor: bgDark,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: bgDarkWhite,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 152 + statusBarHeight,
                decoration: BoxDecoration(
                  color: purpleColor,
                  boxShadow: [
                    BoxShadow(
                      color: "#2F000000".toColor(),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: statusBarHeight + 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 12, right: 12),
                            child: Icon(
                              Icons.arrow_back,
                              size: 24.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: getCustomText(
                            'Just the Girls 🥰🥰',
                            Colors.white,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            24.sp,
                          ),
                        ),
                        SizedBox(
                          width: 12.h,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                        child: Center(
                          child: Image.asset(
                            '${Constants.assetsImagePath}ic_send_msg.png',
                            width: 52.h,
                            height: 52.h,
                            fit: BoxFit.cover,
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
    );
  }
}
