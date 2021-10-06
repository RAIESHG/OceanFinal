import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/profile/profile.dart';
import 'package:ocean_publication/ui/screens/authentication/authentication_base_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends AuthenticationBaseViewmodel {
  TextEditingController emailController = TextEditingController();
  NavigationService navigationService = locator<NavigationService>();
  SnackbarService snackbarService = locator<SnackbarService>();
  Future<void> updateProfile() async {
    setBusy(true);
    var response = await postRequest(
      "/forgot-password",
      body: {"email": emailController.text},
    );
    if (response.statusCode == 200) {
      navigationService.navigateTo(Routes.loginView);
      snackbarService.showSnackbar(
          title: "Success", message: "Password Changed Please Login");
    } else {
      snackbarService.showSnackbar(
          title: "Error", message: "Please Try Again Later");
    }
    setBusy(false);
    notifyListeners();
  }
}
