import 'package:easy_money/app/modules/upload_proof_document/upload_proof_document_controller.dart';
import 'package:get/get.dart';

class UploadProofDocumentBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UploadProofDocumentController>(() => UploadProofDocumentController());
  }
}