import 'package:flutter/cupertino.dart';
import 'package:ocean_publication/ui/screens/authentication/auth_presenter.dart';
import 'package:ocean_publication/ui/screens/dashboard/homepage/homepage_view.dart';

import '../authentication_base_viewmodel.dart';

class LoginViewModel extends AuthenticationBaseViewmodel {
  late BuildContext context;
  onModelReady(BuildContext context) {
    this.context = context;
  }

  //
  Future<void> login() async {
    //
    print(emailController.text);
    print(passwordController.text);
    setBusy(true);
    final body = {
      "email": emailController.text.toLowerCase().trim(),
      "password": passwordController.text.toLowerCase().trim(),
    };
    await authenticate("login", body);

    setBusy(false);
    notifyListeners();
  }
}
