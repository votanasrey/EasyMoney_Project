import 'package:get/get.dart';
import 'otp_verification.dart';

class OTPVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(
          () => OTPController(),
    );
  }
}