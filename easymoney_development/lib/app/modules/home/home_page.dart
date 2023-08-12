import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/data/repositories/loan_request_repo.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'home.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      Obx(() {
        if (listLoanRequests.value.isEmpty) {
          return const SizedBox();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // const Text(
            //   "Loan Request",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            if (listLoanRequests.value.first.status == 'approved')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$ ${double.parse(listLoanRequests.value.first.loanPredict!).toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.greenPrimaryColor,
                    ),
                  ),
                ],
              ),
            if (listLoanRequests.value.first.status == 'approved')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pay Amount",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$ ${double.parse(listLoanRequests.value.first.payAmount!).toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.greenPrimaryColor,
                    ),
                  ),
                ],
              ),
            if (listLoanRequests.value.first.status != 'approved')
              const SizedBox(height: 10),
            if (listLoanRequests.value.first.status != 'approved')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Monthly Income",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$ ${listLoanRequests.value.first.borrowerMonthIncome}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Monthly Installment",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "\$ ${listLoanRequests.value.first.status != 'approved' ? listLoanRequests.value.first.installment : (double.parse(listLoanRequests.value.first.payAmount) / listLoanRequests.value.first.term).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (listLoanRequests.value.first.status != 'approved')
              const SizedBox(height: 10),
            if (listLoanRequests.value.first.status != 'approved')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Working Experience",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${listLoanRequests.value.first.borrowerLengthExperience} years",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            if (listLoanRequests.value.first.status != 'approved')
              const SizedBox(height: 10),
            if (listLoanRequests.value.first.status != 'approved')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Home Ownership",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.homeOwnerShipList[
                        int.parse(listLoanRequests.value.first.homeOwnership)],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            if (listLoanRequests.value.first.status != 'approved')
              const SizedBox(height: 10),
            if (listLoanRequests.value.first.status != 'approved')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Property Area",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.propertyAreaList[
                        int.parse(listLoanRequests.value.first.addressState)],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Term",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${listLoanRequests.value.first.term} months",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${listLoanRequests.value.first.status}",
                  style: TextStyle(
                    fontSize: 18,
                    color: listLoanRequests.value.first.status == 'refused' ||
                            listLoanRequests.value.first.status == 'pending'
                        ? ColorConstants.warningColor
                        : ColorConstants.successColor,
                  ),
                ),
              ],
            ),
            if (listLoanRequests.value.first.status != 'approved')
              const SizedBox(height: 20),
            if (listLoanRequests.value.first.status != 'approved')
              GestureDetector(
                onTap: () => Get.toNamed(Routes.viewImageRoute, arguments: {
                  'imageList': [listLoanRequests.value.first.bankStatement],
                  'isNetworkImage': false,
                }),
                child: Container(
                  width: getWidth / 4,
                  height: 1.25 * getWidth / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.lightGreyColor,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          listLoanRequests.value.first.bankStatement),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 30),
            if (listLoanRequests.value.first.status == 'pending')
              CustomButton(
                onTap: () => controller.cancelLoanRequest(),
                name: 'Cancel',
              ),
            if (listLoanRequests.value.first.status == 'refused')
              CustomButton(
                onTap: () => Get.toNamed(Routes.termsAndConditionsRoute),
                name: 'Request New Loan',
              ),
            if (listLoanRequests.value.first.status == 'admin-approved')
              CustomButton(
                onTap: () => Get.toNamed(Routes.confirmLoanRequestRoute),
                name: 'Confirm',
              ),
            if (listLoanRequests.value.first.status == 'approved')
              CustomButton(
                onTap: () {
                  Get.snackbar(
                    "Congratulation",
                    "We have transferred money to your bank account",
                    backgroundColor: ColorConstants.successColor.withOpacity(0.5),
                  );
                },
                name: 'Clam Cash',
              ),
            const SizedBox(height: 30),
          ],
        );
      }),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomPageContent(
            title: "Apply loan",
            description:
                "You haven’t applied for a loan yet if you have requested you’ll see your loan request progress here.",
          ),
          const SizedBox(height: 40),
          CustomButton(
            onTap: () => controller.onTapRequest(controller),
            name: 'Request Loan',
          ),
          const SizedBox(height: 40),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstants.lightGreyColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorConstants.blackColor),
        // elevation: 0,
        backgroundColor: ColorConstants.whiteColor,
        title: const Text(
          "Loan",
          style: TextStyle(
            color: ColorConstants.blackColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.notificationRoute),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    IconConstants.bellI,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: ColorConstants.greenPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text("1"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                color: ColorConstants.whiteColor,
                child: listLoanRequests.value.isNotEmpty
                    ? listWidget[0]
                    : listWidget[1],
              );
            }),
            // const SizedBox(height: 40),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 27),
            //   child: const CustomTextCard(
            //       title: "Get Stuck?",
            //       description: "Learn more about loan here."),
            // ),
          ],
        ),
      ),
      // drawer: DrawerPage(),
    );
  }
}
