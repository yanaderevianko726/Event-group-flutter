// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/my_colors.dart';
import '../../controllers/groups/group_info_controller.dart';
import 'groupInfo/group_event.dart';
import 'groupInfo/group_info.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({super.key});

  @override
  _GroupInfoPageWidget createState() => _GroupInfoPageWidget();
}

class _GroupInfoPageWidget extends State<GroupInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupInfoController>(
      init: GroupInfoController(),
      builder: (groupInfoController) => Container(
        height: double.infinity,
        width: double.infinity,
        color: bgDarkWhite,
        child: groupInfoController.index == 0
            ? const GroupInfoDetail()
            : const GroupEventDetails(),
      ),
    );
  }
}
