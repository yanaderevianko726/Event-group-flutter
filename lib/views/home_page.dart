import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'explore/explore_page.dart';
import 'groups/groups_page.dart';
import 'profile/profile_widget.dart';
import '../utils/my_colors.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  HomePageController hController = Get.put(HomePageController());
  final pageWidgets = [
    const ExplorePage(),
    const ProfileWidget(),
    const GroupsPage(),
    const ProfileWidget(),
    const ProfileWidget(),
  ];

  final statusBarColors = [
    purpleColor,
    purpleColor,
    blueLight,
    purpleColor,
    purpleColor,
  ];

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (homePageController) => WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: statusBarHeight,
                color: statusBarColors[homePageController.selectedPage],
              ),
              Expanded(child: pageWidgets[homePageController.selectedPage]),
            ],
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
      items: [
        TabItem(icon: Icon(Icons.explore, color: homeController.selectedPage == 0? purpleColor:disabledColor,), title: 'Explore'),
        TabItem(icon: Icon(Icons.home_outlined, color: homeController.selectedPage == 1? purpleColor:disabledColor,), title: 'Users'),
        TabItem(icon: Icon(Icons.chat_bubble_outline, color: homeController.selectedPage == 2? purpleColor:disabledColor,), title: 'Groups'),
        TabItem(icon: Icon(Icons.bookmark_border, color: homeController.selectedPage == 3? purpleColor:disabledColor,), title: 'Saved'),
        TabItem(icon: Icon(Icons.person_outline, color: homeController.selectedPage == 4? purpleColor:disabledColor,), title: 'Profile'),
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
      activeColor: purpleColor,
      style: TabStyle.react,
      backgroundColor: Colors.white,
    );
  }
}
