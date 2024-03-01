import 'package:barry_allan/controller/auth_controller.dart';
import 'package:barry_allan/controller/chat_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ChatController());
  }
}
