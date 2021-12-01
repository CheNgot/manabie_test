import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:manabie_interview/base/base_controller.dart';

class InProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InProgressTaskController());
  }
}

class InProgressTaskController extends BaseController {

  @override
  void onInit() async {
    super.onInit();
  }

}