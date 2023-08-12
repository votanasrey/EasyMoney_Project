import 'account_setting.dart';
import 'package:get/get.dart';

class AccountSettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingController>(() => AccountSettingController());
  }

}