import 'package:get/get.dart';
import 'ask_to_verify_kyc.dart';

class AskToVerifyKycBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskToVerifyKycController>(
      () => AskToVerifyKycController(),
    );
  }
}
