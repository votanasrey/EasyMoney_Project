import 'package:easy_money/app/modules/confirm_loan_request/confirm_loan_request.dart';
import 'package:easy_money/app/modules/dashboard/dashboard.dart';
import 'package:easy_money/app/modules/edit_profile/edit_profile_binding.dart';
import 'package:easy_money/app/modules/edit_profile/edit_profile_page.dart';
import 'package:easy_money/app/modules/marketplace/marketplace_binding.dart';
import 'package:easy_money/app/modules/marketplace/marketplace_page.dart';
import 'package:easy_money/app/modules/otp_verification/otp_verification.dart';
import 'package:easy_money/app/modules/terms_and_conditions/terms_and_conditions.dart';
import 'package:easy_money/app/modules/upload_proof_document/upload_proof_document.dart';
import 'package:easy_money/app/modules/upload_transaction_receipt/upload_transaction_receipt.dart';

import '../modules/notfound/not_found_page.dart';
import '../modules/modules.dart';

import 'routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  AppPages._(); //this is to prevent anyone from instantiating this object
  String splashRoute = Routes.splashRoute;

  static final notFountRoute = GetPage(
    name: Routes.notFoundRoute,
    page: () => const NotfoundPage(),
  );

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.signInRoute,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpRoute,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.dashboardRoute,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      // bindings: [
      //   DashboardBinding(),
      //   HomeBinding(),
      //   MarketplaceBinding(),
      //   ProfileBinding(),
      // ],
    ),
    // GetPage(
    //   name: Routes.homeRoute,
    //   page: () => const HomePage(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: Routes.productDetailRoute,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: Routes.notificationRoute,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.otpVerificationRoute,
      page: () => const OTPVerificationPage(),
      binding: OTPVerificationBinding(),
    ),
    GetPage(
      name: Routes.verifyingKycRoute,
      page: () => const VerifyingKycPage(),
      binding: VerifyingKycBinding(),
    ),
    GetPage(
      name: Routes.askToVerifyKycRoute,
      page: () => const AskToVerifyKycPage(),
      binding: AskToVerifyKycBinding(),
    ),
    GetPage(
      name: Routes.verifyingTransactionRoute,
      page: () => const VerifyingTransactionPage(),
      binding: VerifyingTransactionBinding(),
    ),
    GetPage(
      name: Routes.processingRequestLoanRoute,
      page: () => const ProcessingRequestLoanPage(),
      binding: ProcessingRequestLoanBinding(),
    ),
    GetPage(
      name: Routes.categoryProductRoute,
      page: () => const CategoryProductPage(),
      binding: CategoryProductBinding(),
    ),
    GetPage(
      name: Routes.viewImageRoute,
      page: () => const ViewImagePage(),
      binding: ViewImageBinding(),
    ),
    // GetPage(
    //   name: Routes.profileRoute,
    //   page: () => const ProfilePage(),
    //   binding: ProfileBinding(),
    // ),
    GetPage(
      name: Routes.searchProductRoute,
      page: () => const SearchProductPage(),
      binding: SearchProductBinding(),
    ),
    GetPage(
      name: Routes.uploadProductRoute,
      page: () => const UploadProductPage(),
      binding: UploadProductBinding(),
    ),
    GetPage(
      name: Routes.myProductsRoute,
      page: () => const MyProductPage(),
      binding: MyProductsBinding(),
    ),
    GetPage(
      name: Routes.myOrdersRoute,
      page: () => const MyOrdersPage(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: Routes.myFavoritesRoute,
      page: () => const MyFavoritesPage(),
      binding: MyFavoritesBinding(),
    ),
    GetPage(
      name: Routes.processingLoanRoute,
      page: () => const ProcessingLoanPage(),
      binding: ProcessingLoanBinding(),
    ),
    GetPage(
      name: Routes.loanHistoryRoute,
      page: () => const LoanHistoryPage(),
      binding: LoanHistoryBinding(),
    ),
    GetPage(
      name: Routes.accountSettingRoute,
      page: () => const AccountSettingPage(),
      binding: AccountSettingBinding(),
    ),
    GetPage(
      name: Routes.marketplaceRoute,
      page: () => const MarketplacePage(),
      binding: MarketplaceBinding(),
    ),
    GetPage(
      name: Routes.editProfileRoute,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.uploadTransactionReceiptRoute,
      page: () => const UploadTransactionReceiptPage(),
      binding: UploadTransactionReceiptBinging(),
    ),
    GetPage(
      name: Routes.confirmLoanRequestRoute,
      page: () => const ConfirmLoanRequestPage(),
      binding: ConfirmLoanRequestBinding(),
    ),
    GetPage(
      name: Routes.uploadProofDocumentRoute,
      page: () => const UploadProofDocumentPage(),
      binding: UploadProofDocumentBinding(),
    ),
    GetPage(
      name: Routes.termsAndConditionsRoute,
      page: () => const TermsAndConditionsPage(),
      binding: TermsAndConditionsBinding(),
    ),
  ];
}
