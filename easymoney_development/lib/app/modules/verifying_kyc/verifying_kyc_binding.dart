import 'package:get/get.dart';
import 'verifying_kyc.dart';

class VerifyingKycBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyingKycController>(
      () => VerifyingKycController(),
    );
  }
}
