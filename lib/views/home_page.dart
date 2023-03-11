import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'events/event_home.dart';
import 'events/upcoming/upcoming_event_page.dart';
import 'profile/profile_widget.dart';
import '../utils/my_colors.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final pageWidgets = [
    const UpcomingEventsPage(),
    const EventsHomeWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    HomePageController hController = Get.put(HomePageController());
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (homePageController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: pageWidgets[homePageController.selectedPage],
          ),
          bottomNavigationBar: buildHomeBottomBar(homePageController),
          backgroundColor: bgDark,
        ),
        onWillPop: () async {
          if (homePageController.selectedPage > 0) {
            homePageController.onChange(0, (val) {
              setState(() {});
            });
          } else {
            Future.delayed(const Duration(milliseconds: 100), () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }
          return false;
        },
      ),
    );
  }

  Widget buildHomeBottomBar(homeController) {
    return ConvexAppBar(
      items: const [
        TabItem(icon: Icons.calendar_month_rounded, title: 'UpComing'),
        TabItem(icon: Icons.event_available_rounded, title: 'Events'),
        TabItem(icon: Icons.manage_accounts, title: 'Profile')
      ],
      initialActiveIndex: homeController.selectedPage,
      onTap: (count) {
        homeController.onChange(count, (val) {
          setState(() {});
        });
      },
      height: 58.h,
      elevation: 5,
      color: bottomBarInActive,
      top: -20.h,
      curveSize: 85.h,
      activeColor: primaryLightColor,
      style: TabStyle.reactCircle,
      backgroundColor: Colors.white,
    );
  }
}
