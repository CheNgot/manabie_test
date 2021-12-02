import 'package:get/get.dart';
import 'package:manabie_interview/base/base_controller.dart';
import 'package:manabie_interview/base/database/database.dart';
import 'package:manabie_interview/base/database/entity/task.dart';

class AllTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTaskController());
  }
}

class AllTaskController extends BaseController {
  List<Task> listTasks=[];

  @override
  void onInit() async {
    super.onInit();
     getListTask();
  }

  getListTask() async {
    List<Task> result= await Get.find<AppDb>().taskDao.listAllTask();
    listTasks=result;
    update();


  }
  void toggle(int index) {
    listTasks[index].isComplete = !(listTasks[index].isComplete ?? true);
    Get.find<AppDb>().taskDao.updateTask(listTasks[index]);
    update();
  }
  void insertTask(String name,String content) {
    var task= Task(name: name,content: content,isComplete: false);
    Get.find<AppDb>().taskDao.insertPerson(task);
    update();

  }

}