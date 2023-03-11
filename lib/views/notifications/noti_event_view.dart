import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/notifications/noti_event_controller.dart';
import 'package:popuppros/models/model.dart';
import 'package:popuppros/models/tent_model.dart';

import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class NotiEventViewPage extends StatefulWidget {
  final NotificationModel notificationModel;

  const NotiEventViewPage({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  State<NotiEventViewPage> createState() => _NotiEventViewPageState();
}

class _NotiEventViewPageState extends State<NotiEventViewPage> {
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  VendorModel vendorModel = VendorModel();
  EventModel eventModel = EventModel();
  TentModel tentModel = TentModel();

  loadVendorModel() async {
    final snapshot = await dbRef
        .child(Constants.vendorsRef)
        .child('${widget.notificationModel.fromId}')
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> vendorMap = <String, dynamic>{};
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        vendorMap['$key'] = value;
      });
      setState(() {
        vendorModel = VendorModel.fromJson(vendorMap);
      });
    }
  }

  loadEventModel() async {
    final snapshot = await dbRef
        .child(Constants.allEventsRef)
        .child('${widget.notificationModel.toId}')
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> eventMap = <String, dynamic>{};
      final objectMap = snapshot.value as Map<Object?, Object?>;
      objectMap.forEach((key, value) {
        eventMap['$key'] = value;
      });
      setState(() {
        eventModel = EventModel.fromJson(eventMap);
        List<dynamic> tentMap =
            jsonDecode(eventModel.tentSlots!) as List<dynamic>;
        for (var element in tentMap) {
          Map<String, dynamic> eleMap = element;
          tentModel = TentModel.fromJson(eleMap);
        }
      });
    }
  }

  initData() async {
    await loadVendorModel();
    await loadEventModel();
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotiEventController>(
      init: NotiEventController(),
      builder: (notiEventController) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    topAppBar(
                      title: '${widget.notificationModel.title}',
                      icons: [],
                      showBack: true,
                    ),
                    ConstantWidget.getVerSpace(40.h),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.h),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ConstantWidget.getTextWidget(
                                  '${widget.notificationModel.content}',
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                  maxLines: 2,
                                  overflow: false),
                              ConstantWidget.getVerSpace(48.h),
                              Row(
                                children: [
                                  ConstantWidget.getTextWidget(
                                    "Event Name",
                                    textColor,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    18.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}img_info.png',
                                      width: 18.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )
                                ],
                              ),
                              ConstantWidget.getVerSpace(12.h),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 12.h),
                                child: ConstantWidget.getTextWidget(
                                  '${eventModel.venueName}',
                                  Colors.black87.withOpacity(0.7),
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              ConstantWidget.getVerSpace(32.h),
                              Row(
                                children: [
                                  ConstantWidget.getTextWidget(
                                    "Requested Slot",
                                    textColor,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    18.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}img_info.png',
                                      width: 18.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )
                                ],
                              ),
                              ConstantWidget.getVerSpace(12.h),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 12.h),
                                child: ConstantWidget.getTextWidget(
                                  '\$${tentModel.price} ${tentModel.size1}x${tentModel.size2} ${tentModel.curTents}/${tentModel.totalTents}',
                                  Colors.black87.withOpacity(0.7),
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              ConstantWidget.getVerSpace(32.h),
                              Row(
                                children: [
                                  ConstantWidget.getTextWidget(
                                    "Vendor Name",
                                    textColor,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    18.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}img_info.png',
                                      width: 18.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )
                                ],
                              ),
                              ConstantWidget.getVerSpace(12.h),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 12.h),
                                child: ConstantWidget.getTextWidget(
                                  '${vendorModel.vendorName}',
                                  Colors.black87.withOpacity(0.7),
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              ConstantWidget.getVerSpace(32.h),
                              Row(
                                children: [
                                  ConstantWidget.getTextWidget(
                                    "Vendor Type",
                                    textColor,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    18.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}img_info.png',
                                      width: 18.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )
                                ],
                              ),
                              ConstantWidget.getVerSpace(12.h),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 12.h),
                                child: ConstantWidget.getTextWidget(
                                  '${vendorModel.vendorType}',
                                  Colors.black87.withOpacity(0.7),
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              ConstantWidget.getVerSpace(32.h),
                              Row(
                                children: [
                                  ConstantWidget.getTextWidget(
                                    "Location",
                                    textColor,
                                    TextAlign.center,
                                    FontWeight.w500,
                                    18.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Image.asset(
                                      '${Constants.assetsImagePath}img_info.png',
                                      width: 18.h,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )
                                ],
                              ),
                              ConstantWidget.getVerSpace(12.h),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 12.h),
                                child: ConstantWidget.getTextWidget(
                                  '${vendorModel.location}',
                                  Colors.black87.withOpacity(0.7),
                                  TextAlign.start,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ),
                              ConstantWidget.getVerSpace(72.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      confirmDialog(notiEventController,
                                          'Do you want to reject this vendor?',
                                          (val) {
                                        if (val) {
                                          rejectRequest(
                                            context,
                                            notiEventController,
                                          );
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 72.h,
                                      height: 72.h,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: "#0F000000".toColor(),
                                            blurRadius: 10,
                                            offset: const Offset(0, 2),
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          '${Constants.assetsImagePath}ic_reject.png',
                                          width: 24,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      confirmDialog(notiEventController,
                                          'Do you want to accept this vendor?',
                                          (val) {
                                        if (val) {
                                          acceptRequest(
                                            context,
                                            notiEventController,
                                          );
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 72.h,
                                      height: 72.h,
                                      margin: EdgeInsets.only(left: 72.h),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                        color: primaryLightColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: "#0F000000".toColor(),
                                            blurRadius: 10,
                                            offset: const Offset(0, 2),
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          '${Constants.assetsImagePath}155884.png',
                                          width: 40,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                child: notiEventController.isLoading
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
      ),
    );
  }

  rejectRequest(
    BuildContext context,
    NotiEventController notiEventController,
  ) async {
    notiEventController.rejectVendorRequest(
        widget.notificationModel, eventModel, vendorModel, () {
      showSuccessDialog();
    });
  }

  acceptRequest(
    BuildContext context,
    NotiEventController notiEventController,
  ) {
    notiEventController.acceptVendorRequest(
        widget.notificationModel, eventModel, vendorModel, () {
      showSuccessDialog();
    });
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
            height: 196.h,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 24.h,
                      bottom: 12.h,
                    ),
                    child: const Center(
                      child: Text(
                        'You rejected this request successfully.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48.h,
                      margin: EdgeInsets.only(top: 12.h),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  confirmDialog(
    NotiEventController notiController,
    String title,
    Function callback,
  ) async {
    double btnWidth = (MediaQuery.of(context).size.width - 80) / 2;
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              ConstantWidget.getVerSpace(32.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ConstantWidget.getCustomTextWidget(
                      'PopUpPros',
                      Colors.black,
                      22.sp,
                      FontWeight.w700,
                      TextAlign.start,
                      1,
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: getCustomText(
                  title,
                  textColor,
                  1,
                  TextAlign.start,
                  FontWeight.w500,
                  18.sp,
                ),
              ),
              ConstantWidget.getVerSpace(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: btnWidth,
                    child: getButton(
                      context,
                      primaryColor,
                      "Yes",
                      Colors.white,
                      () {
                        callback(true);
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(
                    width: 28.h,
                  ),
                  SizedBox(
                    width: btnWidth,
                    child: getButton(
                      context,
                      primaryColor,
                      "No",
                      Colors.white,
                      () async {
                        callback(false);
                      },
                      20.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 58.h,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(16.h),
            ],
          ),
        );
      },
    );
  }
}
