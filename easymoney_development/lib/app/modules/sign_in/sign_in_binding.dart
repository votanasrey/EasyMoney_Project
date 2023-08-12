import 'package:easy_money/app/modules/sign_in/sign_in.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}
