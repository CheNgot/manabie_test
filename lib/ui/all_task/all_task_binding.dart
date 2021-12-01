import 'package:get/get.dart';
import 'package:manabie_interview/base/base_controller.dart';

class AllTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTaskController());
  }
}

class AllTaskController extends BaseController {

  @override
  void onInit() async {
    super.onInit();
  }

}