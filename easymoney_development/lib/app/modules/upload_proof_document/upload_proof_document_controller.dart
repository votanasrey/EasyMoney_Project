import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadProofDocumentController extends GetxController{

  var selectedImagePath = ''.obs;

  void getImage(ImageSource imageSource) async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
    }
  }

  void removeImage() {
    selectedImagePath.value = "";
  }
}