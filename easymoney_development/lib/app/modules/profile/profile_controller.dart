import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/models/user_model.dart';
import 'package:easy_money/app/data/repositories/auth_repo.dart';
import 'package:easy_money/app/data/repositories/user_repo.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString profileImage =
      'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'.obs;

  late User user;

  RxBool isLogged = false.obs;

  void updateLogged() {
    var data = box.read(BoxKey.isLogged);
    if (data != null) {
      isLogged.value = data;
    }
  }

  void initData() {
    updateLogged();
    if (isLogged.value) {
      var token = box.read(BoxKey.accessToken);
      debugPrint(token);
      UserRepo userRepo = UserRepo();
      userRepo.getUser(token).then((value) {
        firstName.value = value.firstName;
        lastName.value = value.lastName;
        if (value.userProfile != null) {
          profileImage.value = value.userProfile;
        }
        user = value;
      }).catchError((e) {
        debugPrint(e.toString());
        if (e.toString() == "Exception: 401") {
          box.write(BoxKey.isLogged, false);
          box.remove(BoxKey.accessToken);
          isLogged.value = false;
        }
      });
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void signOut() async {
    AuthRepo authRepo = AuthRepo();
    bool isLoggedOut = false;
    var token = box.read(BoxKey.accessToken);
    isLoggedOut = await authRepo.logout(token);
    if (isLoggedOut) {
      box.write(BoxKey.isLogged, false);
      box.remove(BoxKey.accessToken);
      Get.offNamed(Routes.splashRoute);
    }
  }

  final LoanModel activeLoan = LoanModel(
    price: 228,
    startDate: DateTime(2021, 8, 10),
    endDate: DateTime(2021, 7, 10),
  );

  final List<LoanModel> loanHistory = [
    LoanModel(
      price: 336,
      startDate: DateTime(2021, 7, 20),
      endDate: DateTime(2021, 7, 27),
    ),
    LoanModel(
      price: 57,
      startDate: DateTime(2021, 7, 2),
      endDate: DateTime(2021, 7, 9),
    ),
  ];
}
