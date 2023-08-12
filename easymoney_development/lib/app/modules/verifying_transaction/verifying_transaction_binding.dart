import 'package:get/get.dart';
import 'verifying_transaction.dart';

class VerifyingTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyingTransactionController>(
      () => VerifyingTransactionController(),
    );
  }
}
