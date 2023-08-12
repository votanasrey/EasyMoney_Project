import 'package:get/get.dart';

import 'view_image.dart';

class ViewImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewImageController>(
      () => ViewImageController(),
    );
  }
}
