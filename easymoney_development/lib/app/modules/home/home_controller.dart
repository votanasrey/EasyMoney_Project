import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/repositories/loan_request_repo.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LoanRequestRepo _loanRequestRepo = LoanRequestRepo();

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  void onTapToTop() {
    scrollController.animateTo(
      0,
      duration: DurationConstants.duration600ms,
      curve: Curves.ease,
    );
  }

  RxInt pageIndex = 1.obs;

  bool isLogged = false;

  void updateLogged() {
    var data = box.read(BoxKey.isLogged);
    if (data != null) {
      isLogged = box.read(BoxKey.isLogged);
    }
  }

  void onTapRequest(HomeController homeController) {
    updateLogged();
    if (isLogged) {
      Get.toNamed(
        Routes.termsAndConditionsRoute,
        arguments: homeController,
      );
    } else {
      Get.offAllNamed(Routes.signInRoute);
    }
  }

  void cancelLoanRequest() async {
    Get.defaultDialog(
      title: "Confirm",
      radius: 5,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Text("Do you want to cancel the request?"),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            "No",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            _loanRequestRepo.updateStatus(listLoanRequests.value.first.id! ,status: "refused").then((value) {
              Get.back();
              getListLoanRequests();
            });
          },
          child: const Text(
            "Yes",
            style: TextStyle(
              fontSize: 16,
              color: ColorConstants.dangerColor,
            ),
          ),
        ),
      ],
    );
  }

  var homeOwnerShipList = ["Own", "Rent", "Mortgage", "Any"];
  var propertyAreaList = ["Urban Area", "Rural Area"];

  @override
  void onInit() {
    if (box.read("page") != null) {
      pageIndex.value = box.read("page");
    }
    super.onInit();
  }
}
