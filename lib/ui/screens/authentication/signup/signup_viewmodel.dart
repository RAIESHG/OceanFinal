import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/screens/authentication/auth_presenter.dart';
import 'package:ocean_publication/ui/screens/authentication/login/login_view.dart';
import 'package:ocean_publication/ui/screens/dashboard/homepage/homepage_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../authentication_base_viewmodel.dart';

class SignupViewModel extends AuthenticationBaseViewmodel {
  late BuildContext context;
  onModelReady(BuildContext context) {
    this.context = context;
  }

  Future<void> signup() async {
    //
    print(emailController.text);
    print(passwordController.text);

    setBusy(true);
    try {
      final body = {
        "first_name": firstnameController.text,
        "last_name": lastnameController.text,
        "email": emailController.text.toLowerCase().trim(),
        "password": passwordController.text.toLowerCase().trim(),
        "password_confirmation": confirmPasswordController.text.trim(),
      };
      await authenticate("register", body);
      NavigationService navigationService = locator<NavigationService>();
      navigationService.navigateTo(
        Routes.authPresenter,
      );
    } catch (e) {
      print(e);
    }
    setBusy(false);
    notifyListeners();
  }
}
