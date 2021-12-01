import 'package:get/get.dart';
import 'package:manabie_interview/ui/all_task/all_task_binding.dart';
import 'package:manabie_interview/ui/done_task/done_task_binding.dart';
import 'package:manabie_interview/ui/in_progress_task/in_progress_task_binding.dart';
import 'package:manabie_interview/ui/in_progress_task/in_progress_task_screen.dart';

import 'bottom_navigation_view_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationViewController());
    Get.lazyPut(() => AllTaskController());
    Get.lazyPut(() => DoneTaskController());
    Get.lazyPut(() => InProgressTaskController());
  }
}
