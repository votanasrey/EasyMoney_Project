import 'package:country_code_picker/country_code.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/repositories/auth_repo.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var count = 0.obs;

  TextEditingController phoneNumber = TextEditingController();
  CountryCode countryCode = CountryCode.fromDialCode("+855");
  TextEditingController password = TextEditingController();

  RxBool hidden = (true).obs;

  void onTapSignIn() {
    if (phoneNumber.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Phone number is required",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      if (password.text.isEmpty) {
        Get.snackbar(
          "Error",
          "Password is required",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        signIn();
      }
    }
  }

  void signIn() {
    AuthRepo authRepo = AuthRepo();
    int num = int.parse(phoneNumber.text.trim());
    String fullPhoneNumber = countryCode.dialCode! + num.toString();

    authRepo
        .logIn(
      phoneNumber: fullPhoneNumber,
      password: password.text,
    ).then((value) {
      AccessToken accessToken = value;
      debugPrint(accessToken.accessToken);
      box.write(BoxKey.isLogged, true);
      box.write(BoxKey.accessToken, accessToken.accessToken);
      Get.offAllNamed(Routes.dashboardRoute);
    }).catchError((e) {
      if (e.toString() == "Exception: 401") {
        Get.snackbar(
          "Error",
          "Invalid credential",
          backgroundColor: ColorConstants.dangerColor,
        );
      }
    });
  }
}
