import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/shared/constant/common.dart';
import 'package:manabie_interview/shared/utils/dimens.dart';


/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

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
        backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
      ),


    ];
  }
}
