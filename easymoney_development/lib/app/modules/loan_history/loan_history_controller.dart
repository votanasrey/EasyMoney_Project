import 'package:easy_money/app/data/models/loan_model.dart';
import 'package:get/get.dart';

class LoanHistoryController extends GetxController {
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