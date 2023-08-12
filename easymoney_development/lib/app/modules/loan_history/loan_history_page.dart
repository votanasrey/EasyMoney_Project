import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/custom_back_app_bar.dart';
import 'package:easy_money/app/core/widgets/custom_button.dart';
import 'package:easy_money/app/core/widgets/custom_loan_card.dart';
import 'package:easy_money/app/core/widgets/loan_list_tile.dart';
import 'package:easy_money/app/routes/app_routes.dart';

import 'loan_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanHistoryPage extends GetView<LoanHistoryController> {
  const LoanHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyColor,
      appBar: customBackAppBar(
        title: 'Loans',
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _activeLoan,
            const Padding(
              padding: EdgeInsets.only(left: 27, top: 20),
              child: Text(
                "Loan History",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.greyPramiryColor),
              ),
            ),
            _loanHistory,
          ],
        ),
      ),
    );
  }

  get _activeLoan {
    return Container(
      color: ColorConstants.whiteColor,
      padding: const EdgeInsets.only(top: 20, bottom: 30, left: 27, right: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Active Loan",
            style: TextStyle(
              fontSize: 18,
              color: ColorConstants.greyPramiryColor,
            ),
          ),
          const SizedBox(height: 20,),
          CustomLoanCard(
            child: Column(
              children: [
                LoanListTile(
                  title: "Is due on",
                  dateTime: controller.activeLoan.endDate,
                  price: controller.activeLoan.price,
                  isGreyColor: false,
                ),
                const SizedBox(height: 50),
                CustomButton(
                  name: "Pay Now",
                  onTap: () => Get.toNamed(Routes.uploadTransactionReceiptRoute),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  get _loanHistory {
    return Column(
      children: controller.loanHistory.map(
        (e) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 27,
              vertical: 10,
            ),
            child: CustomLoanCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoanListTile(
                    title: "Paid on",
                    dateTime: e.endDate,
                    price: e.price,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoanListTile(
                    title: "Requested on",
                    dateTime: e.startDate,
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
