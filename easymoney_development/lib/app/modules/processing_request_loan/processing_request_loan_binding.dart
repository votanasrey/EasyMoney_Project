import 'package:easy_money/app/modules/home/home.dart';
import 'package:get/get.dart';
import 'processing_request_loan.dart';

class ProcessingRequestLoanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessingRequestLoanController>(
      () => ProcessingRequestLoanController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
