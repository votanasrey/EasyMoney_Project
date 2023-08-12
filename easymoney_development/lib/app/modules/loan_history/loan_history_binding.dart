import 'loan_history.dart';
import 'package:get/get.dart';

class LoanHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanHistoryController>(() => LoanHistoryController());
  }

}