import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:manabie_interview/base/base_controller.dart';

class DoneTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoneTaskController());
  }
}

class DoneTaskController extends BaseController {

  @override
  void onInit() async {
    super.onInit();
  }

}