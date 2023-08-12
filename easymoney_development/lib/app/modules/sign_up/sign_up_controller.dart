import 'package:country_code_picker/country_code.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/models/access_token_model.dart';
import 'package:easy_money/app/data/repositories/auth_repo.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigUpController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  CountryCode countryCode = CountryCode.fromDialCode("+855");
  TextEditingController password = TextEditingController();
  TextEditingController passwordConf = TextEditingController();

  var genderSelected = 0.obs;
  var genderList = [
    "Male",
    "Female",
    "Other",
  ];

  var dateOfBirth = DateTime.now().obs;

  RxBool hidden = true.obs;
  RxBool confHidden = true.obs;

  var pageIndex = 0.obs;

  void onTapButton() {
    if (pageIndex.value == 0) {
      _validateName();
    } else if (pageIndex.value == 1) {
      _validateDateOfBirthAndAddress();
    } else {
      _validatePhoneNumberAndPassword();
    }
  }

  void _validateName() {
    if (firstName.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "First name is required",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      if (lastName.text.trim().isEmpty) {
        Get.snackbar(
          "Error",
          "Last name is required",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        pageIndex.value++;
      }
    }
  }

  void _validateDateOfBirthAndAddress() {
    DateTime now = DateTime.now();
    int age = now.year - dateOfBirth.value.year;
    if (age < 16) {
      Get.snackbar(
        "Error",
        "You should be older than 15",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      if (address.text.trim().isEmpty) {
        Get.snackbar(
          "Error",
          "Address is required",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        pageIndex.value++;
      }
    }
  }

  void _validatePhoneNumberAndPassword() {
    if (phoneNumber.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Phone Number is required",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      if (phoneNumber.text.length < 8) {
        Get.snackbar(
          "Error",
          "Invalid phone number",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        _validatePassword();
      }
    }
  }

  void _validatePassword() {
    if (password.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Password is required",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      if (password.text.length < 8) {
        Get.snackbar(
          "Error",
          "Password should be more then 7 digits",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        _confirmPassword();
      }
    }
  }

  void _confirmPassword() {
    if (passwordConf.text.isEmpty) {
      Get.snackbar(
        "Error",
        "You didn't confirm password",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      if (passwordConf.text != password.text) {
        Get.snackbar(
          "Error",
          "Password doesn't match",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        _signUp();
      }
    }
  }

  void _signUp() {
    int num = int.parse(phoneNumber.text);
    String fullPhoneNumber = countryCode.dialCode.toString() + num.toString();
    AuthRepo authRepo = AuthRepo();

    authRepo.register(
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      phoneNumber: fullPhoneNumber,
      password: password.text,
      passwordConfirmation: passwordConf.text,
      gender: genderList[genderSelected.value],
      dateOfBirth: dateOfBirth.value,
      address: address.text.trim(),
    ).then((value) {
      _signIn(value.phoneNumber, password.text);
    }).catchError((e) {
      if (e.toString() == "Exception: 422") {
        Get.snackbar(
          "Error",
          "Phone number is already registered",
          backgroundColor: ColorConstants.dangerColor,
        );
      } else {
        debugPrint(e.toString());
      }
    });
  }

  void _signIn(String phone, String pass) {
    AuthRepo authRepo = AuthRepo();

    authRepo
        .logIn(
      phoneNumber: phone,
      password: pass,
    )
        .then((value) {
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
