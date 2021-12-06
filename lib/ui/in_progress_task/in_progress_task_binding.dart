import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:manabie_interview/shared/utils/event_bus_utils.dart';

class InProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InProgressTaskController());
  }
}

class InProgressTaskController extends BaseController {
  List<Task> listTasks=[];


  @override
  void onInit() async {
    super.onInit();
    getListTasksInProgress();
    EventBusUtils.getInstance()?.on().listen((event) {
      getListTasksInProgress();
    });

  }

  void getListTasksInProgress()  async{
    List<Task> result= await Get.find<AppDb>().taskDao.findTasksIncomplete();
    listTasks=result;
    print("List Task In Progess=="+result.toString());
  }

}