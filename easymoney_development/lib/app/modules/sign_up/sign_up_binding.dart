import 'package:get/get.dart';

import 'sign_up.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigUpController>(
      () => SigUpController(),
    );
  }
}
