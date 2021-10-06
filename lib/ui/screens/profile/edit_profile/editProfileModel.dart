import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocean_publication/constants.dart';
import 'package:ocean_publication/helpers/multiImagePicker.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/profile/profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel {
  SnackbarService snackbarService = locator<SnackbarService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  ScrollController listScrollOnTextField = ScrollController();
  String firstname = "First Name";

  String lastname = "Last Name";
  String contactnumber = "Contact number";
  String password = "Password";
  String confirmpassword = "Re-enter password";
  String email = 'Email';
  String address = 'Address';
  bool confirmedit = true;
  FocusNode myFocusNode = new FocusNode();
  Color emailcolor = Colors.grey;
  Color passwordcolor = Colors.grey;
  Color phcolor = Colors.grey;

  Color addresscolor = Colors.grey;
  Color confirmpasscolor = Colors.grey;
  Color lastnamecolor = Colors.grey;
  Color firstnamecolor = Colors.grey;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  Future<void> updateProfile() async {
    onFirstNameChanged(firstNameController.text);
    onLastNameChanged(lastNameController.text);
    onEmailChanged(emailController.text);
    onPhoneNumberChanged(phoneNumberController.text);
    onaddressChanged(addressController.text);

    notifyListeners();
    if (formKey.currentState!.validate()) {
      setBusy(true);

      try {
        var response = await postRequest(
          "/student-profile",
          body: {
            "first_name": firstNameController.text,
            "last_name": lastNameController.text,
            "phone": phoneNumberController.text,
            "address": addressController.text,
          },
        );
        var item = userProfileFromMap(response.body);
        print(item.toMap());
      } catch (e) {
        snackbarService.showSnackbar(message: "Please Try Again Later");
      }
    }
    setBusy(false);

    notifyListeners();
  }

  Future<void> updatePassword() async {
    if (passwordController.text == "" || rePasswordController.text == "") {
      snackbarService.showSnackbar(message: "Empty Password Fields");
    } else {
      try {
        setBusy(true);

        var response = await postRequest(
          "/student-password/update",
          body: {
            "password": passwordController.text,
            "password_confirmation": rePasswordController.text
          },
        );
        var item = userProfileFromMap(response.body);
        print(item.toMap());
      } catch (e) {
        snackbarService.showSnackbar(message: "Please Try Again Later");
      }
      setBusy(false);
      notifyListeners();
    }
  }

  void updateProfilePicture() async {
    setBusy(true);
    try {
      await httpMultipartImageRequest(
          imageFileList: imageFileList,
          url: "${baseUrl}/student-image/update",
          imageField: "image");
    } catch (e) {
      snackbarService.showSnackbar(message: "Please Try Again Later");
    }
    setBusy(false);
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  List<XFile>? image;
  String base64Image = "";
  File? imageFile;
  var imageWebFile;
  var imageByte;
  var imageTemp;
  List<List> imageFileList = [];
  var singleImage;
  // var  imagebyteMob;
  imgFromGallery() async {
    try {
      List<XFile>? pickedImage = await _picker.pickMultiImage();

      for (int i = 0; i < pickedImage!.length; i++) {
        if (image == null) {
          image = [pickedImage[i]];
        } else {
          image!.add(pickedImage[i]);
        }
        notifyListeners();
      }
      imageFileList.add(MultiImagePickerList.getList(image: image));
      imageTemp = File(image![0].path);
    } on PlatformException catch (e) {}

    notifyListeners();
  }

  bool onFirstNameChanged(var val) {
    if (val.length < 3) {
      firstname = "Please enter valid  first name";
      firstnamecolor = Colors.red;
      notifyListeners();

      return false;
    } else {
      firstnamecolor = Colors.green;
      firstname = "Valid Last Name";
      notifyListeners();

      return true;
    }
  }

  bool onLastNameChanged(var val) {
    if (val.length < 3) {
      lastname = "Please enter valid last name";
      lastnamecolor = Colors.red;
      notifyListeners();

      return false;
    } else {
      lastnamecolor = Colors.green;
      lastname = "Valid last Name";
      notifyListeners();

      return true;
    }
  }

  bool onEmailChanged(var val) {
    if (EmailValidator.validate(val) == true) {
      email = "Email Valid";
      emailcolor = Colors.green;
      notifyListeners();

      return true;
    } else {
      emailcolor = Colors.red;
      email = "Invalid Email";
      notifyListeners();

      return false;
    }
  }

  bool onPhoneNumberChanged(var val) {
    if (val.length > 9) {
      phcolor = Colors.green;
      contactnumber = "Contact Number";
      notifyListeners();

      return true;
    } else {
      contactnumber = "Please enter valid contact number";
      phcolor = Colors.red;
      notifyListeners();

      return false;
    }
  }

  bool onaddressChanged(var val) {
    if (val.length > 3) {
      addresscolor = Colors.green;
      address = "Address";

      notifyListeners();

      return true;
    } else {
      address = "Please enter valid address";
      addresscolor = Colors.red;
      notifyListeners();

      return false;
    }
  }

  bool onPasswordChanged(var val) {
    if (val.length > 7) {
      passwordcolor = Colors.green;
      password = "Password";
      confirmedit = false;
      notifyListeners();

      return true;
    } else {
      password = "Please enter valid password";
      passwordcolor = Colors.red;
      notifyListeners();

      return false;
    }
  }

  bool onConfirmPasswordChanged(var val) {
    if (val == passwordController.text && val.length > 0) {
      confirmpassword = "Matched";
      confirmpasscolor = Colors.green;
      notifyListeners();

      return true;
    } else {
      confirmpasscolor = Colors.red;
      confirmpassword = "Password Doesnot Match";
      notifyListeners();

      return false;
    }
  }
}
