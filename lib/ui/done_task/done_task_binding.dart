import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';

class DoneTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoneTaskController());
  }
}

class DoneTaskController extends BaseController {
  List<Task> listTasks=[];


  @override
  void onInit() async {
    super.onInit();
    getListTasksDone();

  }

  void getListTasksDone() async {
    List<Task> result= await Get.find<AppDb>().taskDao.findTasksComplete();
    listTasks=result;
    print("List Task Done=="+result.toString());
  }

}