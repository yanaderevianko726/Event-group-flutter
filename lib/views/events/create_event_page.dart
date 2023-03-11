import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/events/create_event_controller.dart';
import 'package:popuppros/routes/app_routes.dart';

import '../../models/tent_model.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/constants.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double halfWidth = (screenWidth - 18.h * 2 - 16) / 2;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgDark,
      body: SafeArea(
        child: GetBuilder<CreateEventController>(
          init: CreateEventController(),
          builder: (createEventController) => Stack(
            children: [
              Container(
                width: screenWidth,
                height: double.infinity,
                color: bgDarkWhite,
                child: Column(children: [
                  topAppBar(
                    title: 'Create a new Event',
                    icons: [],
                    showBack: true,
                  ),
                  ConstantWidget.getVerSpace(12.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          width: screenWidth,
                          height: 48.h,
                          padding: EdgeInsets.only(left: 14.h),
                          color: borderColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ConstantWidget.getTextWidget(
                                "Event Venue",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                            ],
                          ),
                        ),
                        ConstantWidget.getVerSpace(20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Venue Name",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        ConstantWidget.getVerSpace(12.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Venue name",
                            createEventController.venueNameController,
                          ),
                        ),
                        ConstantWidget.getVerSpace(32.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Venue address",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        ConstantWidget.getVerSpace(12.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: ConstantWidget.getDefaultTextFiledWithLabel(
                            context,
                            "Venue address",
                            createEventController.venueAddressController,
                          ),
                        ),
                        ConstantWidget.getVerSpace(32.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Venue description",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        ConstantWidget.getVerSpace(12.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: ConstantWidget.getDescTextFiledWithLabel(
                            context,
                            "Venue description",
                            createEventController.venueDescriptionController,
                            minLines: true,
                            maxLine: 5,
                          ),
                        ),
                        ConstantWidget.getVerSpace(32.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Select Image",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        ConstantWidget.getVerSpace(12.h),
                        if (createEventController.imageFile != null)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                selectTakePhotoMethod(
                                    context, createEventController);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  File(createEventController.imageFile!.path),
                                  width: double.infinity,
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        if (createEventController.imageFile == null)
                          InkWell(
                            onTap: () {
                              selectTakePhotoMethod(
                                  context, createEventController);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200.h,
                              margin: EdgeInsets.symmetric(
                                horizontal: 16.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                color: borderColor.withOpacity(0.8),
                              ),
                              child: Icon(
                                Icons.image_outlined,
                                size: 48.h,
                                color: textColor,
                              ),
                            ),
                          ),
                        ConstantWidget.getVerSpace(12.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: InkWell(
                            onTap: () {
                              selectTakePhotoMethod(
                                  context, createEventController);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 28.h,
                                    color: textColor,
                                  ),
                                ),
                                ConstantWidget.getTextWidget(
                                  "Click here to pick image",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.w400,
                                  18.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ConstantWidget.getVerSpace(24.h),
                        Container(
                          width: screenWidth,
                          height: 48.h,
                          padding: EdgeInsets.only(left: 14.h),
                          color: borderColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ConstantWidget.getTextWidget(
                                "Venue Slots",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 12.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 2.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: halfWidth,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ConstantWidget.getTextWidget(
                                          "Setup Time",
                                          textColor,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          20.sp,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Image.asset(
                                            '${Constants.assetsImagePath}img_info.png',
                                            width: 20.h,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.h),
                                      child: InkWell(
                                        onTap: () {
                                          showEventTimePicker(
                                            context,
                                            0,
                                            createEventController,
                                          );
                                        },
                                        child: Container(
                                          width: halfWidth,
                                          height: 48.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 10.h,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 0.8,
                                                color: borderColor,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                              color: Colors.white),
                                          child: ConstantWidget.getTextWidget(
                                            '${createEventController.eventModel.setupTime}',
                                            textColor,
                                            TextAlign.start,
                                            FontWeight.w500,
                                            18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: halfWidth,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ConstantWidget.getTextWidget(
                                          "Start Time",
                                          textColor,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          20.sp,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Image.asset(
                                            '${Constants.assetsImagePath}img_info.png',
                                            width: 20.h,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.h),
                                      child: InkWell(
                                        onTap: () {
                                          showEventTimePicker(
                                            context,
                                            1,
                                            createEventController,
                                          );
                                        },
                                        child: Container(
                                          width: halfWidth,
                                          height: 48.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 12.h,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 0.8,
                                                color: borderColor,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                              color: Colors.white),
                                          child: ConstantWidget.getTextWidget(
                                            '${createEventController.eventModel.startTime}',
                                            textColor,
                                            TextAlign.start,
                                            FontWeight.w500,
                                            18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.only(top: 24.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: halfWidth,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ConstantWidget.getTextWidget(
                                          "Finish Time",
                                          textColor,
                                          TextAlign.center,
                                          FontWeight.w500,
                                          20.sp,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Image.asset(
                                            '${Constants.assetsImagePath}img_info.png',
                                            width: 20.h,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.h),
                                      child: InkWell(
                                        onTap: () {
                                          showEventTimePicker(
                                            context,
                                            2,
                                            createEventController,
                                          );
                                        },
                                        child: Container(
                                          width: halfWidth,
                                          height: 48.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 12.h,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 0.8,
                                                color: borderColor,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                              color: Colors.white),
                                          child: ConstantWidget.getTextWidget(
                                            '${createEventController.eventModel.finishTime}',
                                            textColor,
                                            TextAlign.start,
                                            FontWeight.w500,
                                            18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 24.h,
                            left: 16.h,
                            right: 16.h,
                          ),
                          child: Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Available Tent Slots",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        if (createEventController.tentSlots.isNotEmpty)
                          for (var i = 0;
                              i < createEventController.tentSlots.length;
                              i++)
                            slotCell(
                              tentSlot: createEventController.tentSlots[i],
                            ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16.h,
                            left: 16.h,
                            right: 16.h,
                          ),
                          child: InkWell(
                            onTap: () {
                              addTentSlot(context, createEventController);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ConstantWidget.getTextWidget(
                                  "+ Available Tent Slots",
                                  primaryLightColor,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  20.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          padding: EdgeInsets.only(
                            top: 32.h,
                            left: 16.h,
                            right: 16.h,
                          ),
                          child: getButton(
                            context,
                            primaryColor,
                            "Create",
                            Colors.white,
                            () async {
                              bool isNetwork = await Functions.getNetwork();
                              if (isNetwork) {
                                createEventController.uploadEventModel((val) {
                                  if (val) {
                                    showSuccessDialog();
                                  }
                                });
                              } else {
                                Functions.showToast("Please turn on Internet");
                              }
                            },
                            20.sp,
                            weight: FontWeight.w700,
                            buttonHeight: 58.h,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ]),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: createEventController.isLoading
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

  addTentSlot(context, CreateEventController createEventController) {
    double screenWidth = MediaQuery.of(context).size.width;
    double halfWidth = (screenWidth - 18.h * 2 - 16) / 2;

    TextEditingController priceController = TextEditingController();
    TextEditingController tentsController = TextEditingController();
    TextEditingController size1Controller = TextEditingController();
    TextEditingController size2Controller = TextEditingController();

    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
          ),
          decoration: getDecorationWithSide(
            radius: 22.h,
            bgColor: bgDarkWhite,
            isTopLeft: true,
            isTopRight: true,
          ),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              ConstantWidget.getVerSpace(8.h),
              Container(
                width: double.infinity,
                height: 8.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 116.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: borderColor,
                ),
              ),
              ConstantWidget.getVerSpace(24.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ConstantWidget.getCustomTextWidget(
                      'Add Tent Slot',
                      Colors.black,
                      22.sp,
                      FontWeight.w700,
                      TextAlign.center,
                      1,
                    ),
                  ),
                ],
              ),
              ConstantWidget.getVerSpace(24.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 12.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: halfWidth,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Price",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: ConstantWidget.getDefaultTextFiledWithLabel(
                              context,
                              "Price",
                              priceController,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: halfWidth,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Total Tents",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: ConstantWidget.getDefaultTextFiledWithLabel(
                              context,
                              "Total Tents",
                              tentsController,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ConstantWidget.getVerSpace(16.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 12.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: halfWidth,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "Size",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: ConstantWidget.getDefaultTextFiledWithLabel(
                              context,
                              "Size 1",
                              size1Controller,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: halfWidth,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ConstantWidget.getTextWidget(
                                "",
                                textColor,
                                TextAlign.center,
                                FontWeight.w500,
                                20.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  '${Constants.assetsImagePath}img_info.png',
                                  width: 20.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.h),
                            child: ConstantWidget.getDefaultTextFiledWithLabel(
                              context,
                              "Size 2",
                              size2Controller,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ConstantWidget.getVerSpace(32.h),
              SizedBox(
                width: double.infinity,
                child: getButton(
                  context,
                  primaryColor,
                  "Add Tent Slot",
                  Colors.white,
                  () async {
                    if (priceController.text.isNotEmpty) {
                      if (tentsController.text.isNotEmpty) {
                        if (size1Controller.text.isNotEmpty) {
                          if (size2Controller.text.isNotEmpty) {
                            TentModel tentModel = TentModel();
                            tentModel.price = priceController.text;
                            tentModel.totalTents = tentsController.text;
                            tentModel.size1 = size1Controller.text;
                            tentModel.size2 = size2Controller.text;
                            createEventController.addTentSlot(tentModel, (val) {
                              if (kDebugMode) {
                                print(
                                    'tentModel.price----->${tentModel.price}');
                              }
                              Navigator.of(context).pop();
                            });
                          } else {
                            showDialog1(context, 'Please enter size 2 value');
                          }
                        } else {
                          showDialog1(context, 'Please enter size 1 value');
                        }
                      } else {
                        showDialog1(context, 'Please enter total tents');
                      }
                    } else {
                      showDialog1(context, 'Please enter price');
                    }
                  },
                  20.sp,
                  weight: FontWeight.w700,
                  buttonHeight: 58.h,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              ConstantWidget.getVerSpace(16.h),
            ],
          ),
        );
      },
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
                      top: 16.h,
                      bottom: 16.h,
                    ),
                    child: const Center(
                      child: Text(
                        'Your event created successfully.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.back(result: true);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48.h,
                      margin: EdgeInsets.only(
                        top: 16.h,
                      ),
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

  selectTakePhotoMethod(
    context,
    CreateEventController createEventController,
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
                      'Pop Up Pros',
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
                  "Please select method.",
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
                      "From Camera",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                        await createEventController.addPhoto(1);
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
                      "From Gallery",
                      Colors.white,
                      () async {
                        Navigator.of(context).pop();
                        await createEventController.addPhoto(2);
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

  showDialog1(context, contentText) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Pop Up Pros'),
        content: Text(contentText),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }

  DateTime? timePicker;

  showEventTimePicker(
    context,
    int type,
    CreateEventController createEventController,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Pop Up Pros'),
        content: TimePickerSpinner(
          is24HourMode: false,
          normalTextStyle: const TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
          highlightedTextStyle: const TextStyle(
            fontSize: 20,
            color: Colors.yellow,
          ),
          spacing: 24,
          itemHeight: 72,
          isForce2Digits: true,
          onTimeChange: (time) {
            timePicker = time;
          },
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              createEventController.setTimes(type, timePicker!);
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}
