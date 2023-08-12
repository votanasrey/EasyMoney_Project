import 'dart:io';

import 'package:easy_money/app/core/constants/api_constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/models/loan_request_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Rx<List<LoanRequest>> listLoanRequests = Rx<List<LoanRequest>>([]);
void getListLoanRequests() async {
  listLoanRequests.value = await LoanRequestRepo().getLoanRequest();
}

class LoanRequestRepo extends GetConnect {
  Future<List<LoanRequest>> getLoanRequest() async {
    String url = baseUri + 'api/loan-requests';

    Response response = await get(
      url,
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization:
        HeaderVal.tokenType + box.read(BoxKey.accessToken).toString(),
      },
    );

    if (response.statusCode != 200) {
      return [];
    }

    List<LoanRequest> loanRequest = loanRequestFromJson(response.bodyString!);
    return loanRequest;
  }

  Future<LoanRequest> requestLoan({
    required int installment,
    required int term,
    required int borrowerMonthIncome,
    required int borrowerLengthExperience,
    required int homeOwnership,
    required int addressState,
    required int loanAmount,
    required String bankStatement,
  }) async {
    String url = baseUri + 'api/loan-requests';

    Response response = await post(
      url,
      {
        "installment": installment,
        "term": term,
        "borrower_month_income": borrowerMonthIncome,
        "borrower_length_experience": borrowerLengthExperience,
        "home_ownership": homeOwnership,
        "address_state": addressState,
        "loan_amount": loanAmount,
        "bank_statement": bankStatement,
      },
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization:
            HeaderVal.tokenType + box.read(BoxKey.accessToken),
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.bodyString);
    }

    LoanRequest loanRequest = LoanRequest.fromJson(response.body);
    return loanRequest;
  }

  Future<LoanRequest> updateStatus(String loanRequestId,{
    required String status,
  }) async {
    String url = baseUri + 'api/loan-requests/'+loanRequestId;

    Response response = await put(
      url,
      {
        "status": status,
      },
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization:
        HeaderVal.tokenType + box.read(BoxKey.accessToken),
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.bodyString);
    }

    LoanRequest loanRequest = LoanRequest.fromJson(response.body);
    return loanRequest;
  }

  Future<String> handleUploadImage(XFile image) async {
    String imageUrl = '';
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('loans/${DateTime.now().millisecondsSinceEpoch.toString()}');
      final task = storageRef.putFile(File(image.path));
      await task.then((picValue) async {
        await picValue.ref.getDownloadURL().then((downloadUrl) {
          debugPrint("URL : " + downloadUrl);
          imageUrl = downloadUrl;
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageUrl;
  }
}
