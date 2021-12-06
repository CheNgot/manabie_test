import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:manabie_interview/shared/utils/event_bus_utils.dart';

class DoneTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoneTaskController());
  }
}

class DoneTaskController extends BaseController {
  List<Task> listTasks=[];
  late Task temp;

  @override
  void onInit() async {
    super.onInit();
    getListTasksDone();
    EventBusUtils.getInstance()?.on()?.listen((event) {
      print(event.state.toString());
      if(event.state.toString() == "Change state"){
        getListTasksDone();
      }
    });

  }

  void getListTasksDone() async {
    List<Task> result= await Get.find<AppDb>().taskDao.findTasksComplete();
    listTasks=result;
    print("List Task Done=="+result.toString());
  }

}