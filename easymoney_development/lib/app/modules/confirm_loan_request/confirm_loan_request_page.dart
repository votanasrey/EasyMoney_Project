import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/custom_back_app_bar.dart';
import 'package:easy_money/app/core/widgets/custom_button.dart';
import 'package:easy_money/app/core/widgets/custom_page_content.dart';
import 'package:easy_money/app/data/repositories/loan_request_repo.dart';
import 'package:easy_money/app/modules/confirm_loan_request/confirm_loan_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmLoanRequestPage extends GetView<ConfirmLoanRequestController> {
  const ConfirmLoanRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        title: "Confirm Loan Request",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 27,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPageContent(
                title: "Confirming",
                description:
                    "Your loan request have been approved. EasyMoney offer you with this option. If you're accept with this offer just confirm and the money will be transfer to your bank account.",
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: ColorConstants.lightGreyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Loan amount
                    const Text(
                      "Loan amount",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "US \$ ${double.parse(listLoanRequests.value.first.loanPredict!).toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: ColorConstants.greenPrimaryColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Interest amount
                    const Text(
                      "Interest amount",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "US \$ ${(double.parse(listLoanRequests.value.first.payAmount) - double.parse(listLoanRequests.value.first.loanPredict!)).toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: ColorConstants.greenPrimaryColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Pay back amount
                    const Text(
                      "Pay back amount",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "US \$ ${double.parse(listLoanRequests.value.first.payAmount).toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: ColorConstants.greenPrimaryColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Interest amount
                    const Text(
                      "Term",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${listLoanRequests.value.first.term} Months",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: ColorConstants.greenPrimaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                isOutlined: true,
                name: "Reject",
                onTap: () => controller.updateLoanRequest('refused'),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                name: "Confirm",
                onTap: () => controller.updateLoanRequest('approved'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
