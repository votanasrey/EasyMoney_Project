// To parse this JSON data, do
//
//     final loanRequest = loanRequestFromJson(jsonString);

import 'dart:convert';

List<LoanRequest> loanRequestFromJson(String str) => List<LoanRequest>.from(json.decode(str).map((x) => LoanRequest.fromJson(x)));

String loanRequestToJson(List<LoanRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoanRequest {
  LoanRequest({
    this.id,
    required this.installment,
    required this.term,
    required this.borrowerMonthIncome,
    required this.borrowerLengthExperience,
    required this.homeOwnership,
    required this.addressState,
    required this.loanAmount,
    this.loanPredict,
    this.payAmount,
    required this.bankStatement,
    this.status,
  });

  String? id;
  String installment;
  int term;
  String borrowerMonthIncome;
  String borrowerLengthExperience;
  String homeOwnership;
  String addressState;
  String loanAmount;
  String? loanPredict;
  dynamic payAmount;
  String bankStatement;
  String? status;

  factory LoanRequest.fromJson(Map<String, dynamic> json) => LoanRequest(
    id: json["id"],
    installment: json["installment"].toString(),
    term: json["term"],
    borrowerMonthIncome: json["borrower_month_income"].toString(),
    borrowerLengthExperience: json["borrower_length_experience"].toString(),
    homeOwnership: json["home_ownership"].toString(),
    addressState: json["address_state"].toString(),
    loanAmount: json["loan_amount"].toString(),
    loanPredict: json["loan_predict"].toString(),
    payAmount: json["pay_amount"],
    bankStatement: json["bank_statement"].toString(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "installment": installment,
    "term": term,
    "borrower_month_income": borrowerMonthIncome,
    "borrower_length_experience": borrowerLengthExperience,
    "home_ownership": homeOwnership,
    "address_state": addressState,
    "loan_amount": loanAmount,
    "bank_statement": bankStatement,
  };
}
