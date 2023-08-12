import 'package:get/get.dart';

import 'upload_product.dart';

class UploadProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadProductController>(
      () => UploadProductController(),
    );
  }
}
