import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popuppros/controllers/vendors/browse_vendors_controller.dart';
import 'package:popuppros/utils/constants.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../models/event_model.dart';
import '../../models/tent_model.dart';
import '../../utils/constant_widgets.dart';
import '../../utils/functions.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets.dart';

class BrowseVendorsPage extends StatefulWidget {
  const BrowseVendorsPage({Key? key}) : super(key: key);

  @override
  State<BrowseVendorsPage> createState() => _BrowseVendorsPageState();
}

class _BrowseVendorsPageState extends State<BrowseVendorsPage> {
  List<Widget> topIcons = [];

  initTopIcons() {
    Widget alert = SizedBox(
      width: 24.h,
      child: Center(
        child: InkWell(
          child: Image.asset(
            '${Constants.assetsImagePath}ic_filter.png',
            width: 24.h,
            fit: BoxFit.fitWidth,
          ),
          onTap: () => {},
        ),
      ),
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgDark,
      body: SafeArea(
        child: GetBuilder<BrowseVendorsController>(
          init: BrowseVendorsController(),
          builder: (browseVendorController) => browseVendorController
                  .swipeItems.isNotEmpty
              ? Stack(
                  children: [
                    SizedBox(
                      width: screenWidth,
                      height: double.infinity,
                      child: Column(
                        children: [
                          topAppBar(
                            title: 'Browse Vendors',
                            icons: topIcons,
                            showBack: true,
                          ),
                          ConstantWidget.getVerSpace(20.h),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.h,
                                vertical: 10.h,
                              ),
                              child: SwipeCards(
                                matchEngine:
                                    browseVendorController.matchEngine!,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      left: 12.h,
                                      right: 12.h,
                                      top: 8.h,
                                      bottom: 26.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: subTextColor.withOpacity(0.6),
                                          blurRadius: 8,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: vendorBrowserCell(
                                      context: context,
                                      vendorModel: browseVendorController
                                          .swipeItems[index].content,
                                      onClickMessage: (vendor) {},
                                      showMessage: false,
                                    ),
                                  );
                                },
                                onStackFinished: () {
                                  if (kDebugMode) {
                                    print("Stack Finished");
                                  }
                                },
                                itemChanged: (SwipeItem item, int index) {
                                  if (kDebugMode) {
                                    print(
                                      "item: ${item.content.vendorType}, index: $index",
                                    );
                                  }
                                },
                                leftSwipeAllowed: true,
                                rightSwipeAllowed: true,
                              ),
                            ),
                          ),
                          ConstantWidget.getVerSpace(12.h),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.h,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (browseVendorController
                                      .swipeItems.isNotEmpty)
                                    swipeBottomButton(
                                      image:
                                          '${Constants.assetsImagePath}ic_refresh.png',
                                      onClick: () {
                                        browseVendorController
                                            .matchEngine!.currentItem
                                            ?.nope();
                                      },
                                    ),
                                  if (browseVendorController
                                      .swipeItems.isNotEmpty)
                                    swipeBottomButton(
                                      width: 68,
                                      imgRate: 0.55,
                                      bgColor: Colors.green,
                                      image:
                                          '${Constants.assetsImagePath}155884.png',
                                      onClick: () {
                                        showTentAlertSheet(browseVendorController);
                                      },
                                    ),
                                  if (browseVendorController
                                      .swipeItems.isNotEmpty)
                                    swipeBottomButton(
                                      image:
                                          '${Constants.assetsImagePath}ic_star.png',
                                      onClick: () {
                                        browseVendorController
                                            .matchEngine!.currentItem
                                            ?.like();
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                          ConstantWidget.getVerSpace(20.h),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: browseVendorController.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: primaryLightColor,
                                backgroundColor: const Color(0x0F000000),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  showTentAlertSheet(
    BrowseVendorsController browseController,
  ) async {
    double screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
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
                  horizontal: 112.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: borderColor,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 36.h,
                ),
                child: Row(
                  children: [
                    ConstantWidget.getTextWidget(
                      "Tent Size",
                      textColor,
                      TextAlign.start,
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
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              ConstantWidget.getVerSpace(12.h),
              SizedBox(
                width: screenWidth * 0.82,
                child: dropdownMenu(
                  items: browseController.tentSizes,
                  selectedValue: browseController.selectedSize,
                  buttonWidth: screenWidth * 0.82,
                  buttonPadding: 20,
                  onChanged: (val) {
                    final index = browseController.tentSizes.indexOf(val);
                    browseController.setSelectedSize(val, index);
                  },
                ),
              ),
              ConstantWidget.getVerSpace(48.h),
              SizedBox(
                width: double.infinity,
                child: getButton(
                  context,
                  primaryColor,
                  "Apply",
                  Colors.white,
                  () async {
                    Navigator.of(context).pop();
                    browseController.inviteVendor(() {
                      browseController.matchEngine!.currentItem?.superLike();
                    });
                  },
                  20.sp,
                  weight: FontWeight.w700,
                  buttonHeight: 58.h,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              ConstantWidget.getVerSpace(24.h),
            ],
          ),
        );
      },
    );
  }
}
