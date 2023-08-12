import 'package:get/get.dart';

import 'marketplace.dart';

class MarketplaceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketplaceController>(
          () => MarketplaceController(),
    );
  }
}