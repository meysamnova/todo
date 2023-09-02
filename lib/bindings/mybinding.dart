import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';

import '../controllers/changethemecontroller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ChangeThemecontroller());
    Get.put(TaskController());
  }
}
