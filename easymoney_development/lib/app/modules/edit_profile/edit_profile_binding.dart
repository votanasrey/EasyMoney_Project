import 'package:get/get.dart';

import 'edit_profile.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
          () => EditProfileController(),
    );
  }
}