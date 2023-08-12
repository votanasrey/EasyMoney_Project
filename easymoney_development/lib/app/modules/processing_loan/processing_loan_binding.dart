import 'processing_loan.dart';
import 'package:get/get.dart';

class ProcessingLoanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessingLoanController>(() => ProcessingLoanController());
  }

}