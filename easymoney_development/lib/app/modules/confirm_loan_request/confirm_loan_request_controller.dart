import 'package:easy_money/app/data/repositories/loan_request_repo.dart';
import 'package:get/get.dart';

LoanRequestRepo _loanRequestRepo = LoanRequestRepo();
class ConfirmLoanRequestController extends GetxController{
  void updateLoanRequest(String status) async {
    _loanRequestRepo.updateStatus(listLoanRequests.value.first.id! ,status: status).then((value) {
      Get.back();
      getListLoanRequests();
    });
  }
}