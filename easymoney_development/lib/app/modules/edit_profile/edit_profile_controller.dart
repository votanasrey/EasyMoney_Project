import 'package:country_code_picker/country_code.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/models/user_model.dart';
import 'package:easy_money/app/data/repositories/user_repo.dart';
import 'package:easy_money/app/modules/modules.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

UserRepo _repo = UserRepo();
class EditProfileController extends GetxController {
  late User _user;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  CountryCode countryCode = CountryCode.fromDialCode("+855");

  RxString profileImage =
      'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'.obs;

  var genderSelected = 0.obs;
  var genderList = [
    "Male",
    "Female",
    "Other",
  ];

  var dateOfBirth = DateTime.now().obs;

  RxString selectedImagePath =''.obs;

  void getImage(ImageSource imageSource) async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
    }
    Get.back();
  }

  void removeImage() {
    selectedImagePath.value = "";
    Get.back();
  }
  void updateUser() async {
    if(selectedImagePath.value != ''){
      await _repo.handleUploadImage(XFile(selectedImagePath.value), _user.id).then((value) {
        _repo.updateUser(box.read(BoxKey.accessToken), {
          "user_profile": value,
          "address": _user.address,
        });
      });
    }

    await _repo.updateUser(box.read(BoxKey.accessToken), {
      "first_name": firstName.text.trim(),
      "last_name": lastName.text.trim(),
      "gender": genderList[genderSelected.value],
      "date_of_birth": dateOfBirth.value.toIso8601String(),
      "address": address.text.trim(),
    }).then((value) {
      Get.back();
      _profileController.initData();
    });
  }

  void initData() {
      _repo.getUser(box.read(BoxKey.accessToken)).then((value) {
        _user = value;
        firstName.text = _user.firstName;
        lastName.text = _user.lastName;
        genderSelected.value = genderList.indexOf(_user.gender);
        dateOfBirth.value = _user.dateOfBirth;
        address.text = _user.address;
        if (_user.userProfile != null) {
          profileImage.value = _user.userProfile;
        }
      }).catchError((e) {
        debugPrint(e.toString());
      });
  }

  late ProfileController _profileController;
  @override
  void onInit() {
    _profileController = Get.arguments;
    initData();
    super.onInit();
  }
}