import 'package:easy_money/app/modules/confirm_loan_request/confirm_loan_request.dart';
import 'package:get/get.dart';

class ConfirmLoanRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmLoanRequestController>(
      () => ConfirmLoanRequestController(),
    );
  }
}
