import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:manabie_interview/shared/utils/dimens.dart';



class BottomNavigationViewController extends BaseController {
  // Fields
  RxInt _currentNavPageIndex = 0.obs;

  late List<BottomNavigationBarItem> _bottomNavigationBarItems;

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

    _bottomNavigationBarItems = populateNavBar(withHeight: 36.w);
    // insertTask(Task(2,"hoho",false));
    // insertTask(Task(3,"hoho",true));
    // deletetask(Task(2,"hoho",false));

   // await listAllTask();
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
        label: "On Progress",
        backgroundColor: Colors.blue,
      ),
    ];
  }
  void insertTask(Task task) {
    Get.find<AppDb>().taskDao.insertPerson(task);

  }

  listAllTask() async {
    var result= await Get.find<AppDb>().taskDao.listAllTask();
    print(result.toString());
  }

  void deletetask(Task task) {
    Get.find<AppDb>().taskDao.deleteTask(task);

  }
}


