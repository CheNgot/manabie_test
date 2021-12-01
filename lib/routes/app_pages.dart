import 'package:get/get.dart';
import 'package:manabie_interview/ui/all_task/all_task_binding.dart';
import 'package:manabie_interview/ui/all_task/all_task_screen.dart';
import 'package:manabie_interview/ui/bottom_nav_view/bottom_navigation_binding.dart';
import 'package:manabie_interview/ui/bottom_nav_view/bottom_navigation_view.dart';
import 'package:manabie_interview/ui/done_task/done_task_binding.dart';
import 'package:manabie_interview/ui/done_task/done_task_screen.dart';
import 'package:manabie_interview/ui/in_progress_task/in_progress_task_binding.dart';
import 'package:manabie_interview/ui/in_progress_task/in_progress_task_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.ALLTASK,
      page: () => AllTaskScreen(),
      binding: AllTaskBinding(),
    ),
    GetPage(
      name: Routes.DONE,
      page: () => DoneTaskScreen(),
      binding: DoneTaskBinding(),
    ),
    GetPage(
      name: Routes.INPROGRESS,
      page: () => InProgressTaskScreen(),
      binding: InProgressBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
  ];
}
