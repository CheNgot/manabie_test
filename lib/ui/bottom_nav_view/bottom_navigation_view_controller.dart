import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:manabie_interview/shared/utils/dimens.dart';
import 'package:manabie_interview/ui/all_task/all_task_screen.dart';
import 'package:manabie_interview/ui/done_task/done_task_screen.dart';
import 'package:manabie_interview/ui/in_progress_task/in_progress_task_screen.dart';



class BottomNavigationViewController extends BaseController {
  // Fields
  RxInt _currentNavPageIndex = 0.obs;

  late List<BottomNavigationBarItem> _bottomNavigationBarItems;
  // var listWidget=[AllTaskScreen(),
  //   DoneTaskScreen(),
  //   InProgressTaskScreen()];
  // var listWidget=[Text("1"),Text("2"),Text("3")];

  int get currentNavPageIndex => _currentNavPageIndex.value;

  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      _bottomNavigationBarItems;

  // Setters
  set currentNavPageIndex(int value) {
    _currentNavPageIndex.value = value;
  }

  // Initialisation - LifeCycle
  @override
  void onInit() async {
    super.onInit();
    listAllTask();
    // getTasksInProgress();
    _bottomNavigationBarItems = populateNavBar(withHeight: 36.w);

  }

  // Methods

  List<BottomNavigationBarItem> populateNavBar({double? withHeight}) {
    return [
      BottomNavigationBarItem(
        icon: Container(
          margin: EdgeInsets.only(bottom: 7.w),
          child: Icon(
            Icons.home,
            size: withHeight,
          ),
        ),
        label: "All task",
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Container(
          margin: EdgeInsets.only(bottom: 7.w),
          child: Icon(
            Icons.done,
            size: withHeight,
          ),
        ),
        label: "Done",
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Container(
          margin: EdgeInsets.only(bottom: 7.w),
          child: Icon(
            Icons.hourglass_bottom,
            size: withHeight,
          ),
        ),
        label: "In Progress",
        backgroundColor: Colors.blue,
      ),
    ];
  }
  void insertTask(String name,String content) {
     var task= Task(name: name,content: content,isComplete: false);
    Get.find<AppDb>().taskDao.insertTask(task);
    update();

  }


  listAllTask() async {
    var result= await Get.find<AppDb>().taskDao.listAllTask();
    print(result.toString());
    update();
  }

  void deletetask(Task task) {
    Get.find<AppDb>().taskDao.deleteTask(task);

  }

  getTasksInProgress() async {
    var result= await Get.find<AppDb>().taskDao.findTasksIncomplete();
    print(result);

  }
}


