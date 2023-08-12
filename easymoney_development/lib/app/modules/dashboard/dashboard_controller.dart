import 'package:easy_money/app/data/repositories/loan_request_repo.dart';
import 'package:get/get.dart';


class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    if (index == 1) {
      getListLoanRequests();
    }
    update();
  }

  @override
  void onInit() {
    getListLoanRequests();
    super.onInit();
  }
}