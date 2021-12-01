import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_interview/base/base_view_view_model.dart';
import 'package:manabie_interview/shared/constant/common.dart';
import 'package:manabie_interview/shared/utils/dimens.dart';
import 'package:manabie_interview/ui/all_task/all_task_screen.dart';
import 'package:manabie_interview/ui/done_task/done_task_screen.dart';
import 'package:manabie_interview/ui/in_progress_task/in_progress_task_screen.dart';

import 'bottom_navigation_view_controller.dart';

class BottomNavigationView extends BaseView<BottomNavigationViewController> {
  @override
  Widget vBuilder() => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "To do",
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: Obx(() => Theme(
              data: ThemeData(splashColor: Colors.transparent),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.lightBlue,
                backgroundColor: Colors.white,
                elevation: 15.w,
                currentIndex: controller.currentNavPageIndex,
                onTap: (index) {
                  controller.currentNavPageIndex = index;
                },
                items: controller.bottomNavigationBarItems,
              ),
            )),
        body: Obx(
          () => IndexedStack(
            index: controller.currentNavPageIndex,
            children: [
              AllTaskScreen(),
              DoneTaskScreen(),
              InProgressTaskScreen()
            ],
          ),
        ),
      );
}
