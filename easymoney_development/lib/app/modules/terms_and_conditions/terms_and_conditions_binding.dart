import 'package:easy_money/app/modules/terms_and_conditions/terms_and_conditions_controller.dart';
import 'package:get/get.dart';

class TermsAndConditionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsAndConditionsController>(
      () => TermsAndConditionsController(),
    );
  }
}
