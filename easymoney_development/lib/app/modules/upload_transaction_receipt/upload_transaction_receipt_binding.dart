import 'package:get/get.dart';

import 'upload_transaction_receipt.dart';

class UploadTransactionReceiptBinging implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => UploadTransactionReceiptController());
  }

}