import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/authResponse/authresponse.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationBaseViewmodel extends BaseViewModel {
  SnackbarService snackbarService = locator<SnackbarService>();
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AuthResponse? authResponse;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  NavigationService navigationService = locator<NavigationService>();

  Future<void> authenticate(
      String apiEndpoint, Map<String, String> data) async {
    setBusyForObject("object", true);
    try {
      var response = await postRequest(
        "/$apiEndpoint",
        body: data,
      );
      authResponse = authResponseFromMap(response.body);
      print(response.body);
      if (authResponse!.status == true) {
        await sharedPreferencesService.saveUser(authResponse!);
        navigationService.navigateTo(Routes.homepageView);
        // snackbarService.showSnackbar(message: "${authResponse!.message}");
      } else {
        // sharedPreferencesService.persistLogin();

        snackbarService.showSnackbar(message: "${authResponse!.message}");
      }
    } catch (e) {
      snackbarService.showSnackbar(title: "Error", message: "$e");
    }

    setBusyForObject("object",false);
    notifyListeners();
  }
}
