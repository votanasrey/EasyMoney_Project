import 'package:easy_money/app/modules/home/home.dart';
import 'package:easy_money/app/modules/marketplace/marketplace.dart';
import 'package:easy_money/app/modules/modules.dart';
import 'package:get/get.dart';
import 'dashboard.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
      fenix: true,
    );
    Get.lazyPut<MarketplaceController>(
      () => MarketplaceController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );
  }
}
