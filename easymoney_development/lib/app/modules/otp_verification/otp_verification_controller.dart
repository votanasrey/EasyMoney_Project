import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  bool fromSignUp = false;

  String otpDesc =
      "We have send OPT to +855 12 345 678. If you did not receive it click on resend OTP.";

  @override
  void onInit() {
    fromSignUp = Get.arguments;
    super.onInit();
  }

  void goto() {
    if(fromSignUp) {
      Get.toNamed(Routes.askToVerifyKycRoute);
    } else {
      isLoggedIn = true;
      Get.offAllNamed(Routes.homeRoute);
    }
  }
}
