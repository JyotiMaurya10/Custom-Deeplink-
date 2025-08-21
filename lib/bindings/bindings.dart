import 'package:deeplink/bindings/all_bindings.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    AllBindings().allBindingInitialize();
  }
}