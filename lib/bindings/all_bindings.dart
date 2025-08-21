import 'package:deeplink/controller/home_controller.dart';
import 'package:get/get.dart';

class AllBindings {
  Future<void> allBindingInitialize() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
