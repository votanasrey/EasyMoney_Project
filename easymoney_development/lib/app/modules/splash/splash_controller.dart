import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    checkAccount();
  }

  Future<void> checkAccount() async {
    // box.write(BoxKey.isLogged, false);
    // box.remove(BoxKey.accessToken);
    box.write("page", 1);
    await Future.delayed(
      DurationConstants.duration2s,
      () => Get.offAllNamed(Routes.dashboardRoute),
    );
  }
}
