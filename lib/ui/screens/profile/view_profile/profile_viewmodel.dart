import 'dart:convert';

import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/authResponse/authresponse.dart';
import 'package:ocean_publication/model/profile/profile.dart';
import 'package:ocean_publication/model/profile/userProfileResponse.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  AuthResponse? _authResponse;
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  User? user;
  ProfileData? item;
  Future<void> getUser() async {
    _authResponse = await sharedPreferencesService.getCachedUser();
    user = _authResponse != null ? _authResponse!.user : null;
    notifyListeners();
  }

  Future<void> getUserDetails() async {
    setBusy(true);
    await getUser();
    //
    var response = await getRequest("/student-profile");
    item = profileResponseFromJson(response.body).data;
    setBusy(false);
    notifyListeners();
  }

  navigatetoeditProfile() {
   Future.delayed(Duration(seconds: 1));
    navigationService.navigateTo(Routes.editProfileView);
  }
}
