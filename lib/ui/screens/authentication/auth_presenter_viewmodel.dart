import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthPresenterViewModel extends BaseViewModel {
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  NavigationService navigationService = locator<NavigationService>();
  onModelReady() async {
    await sharedPreferencesService.loginCheck() == true
        ? navigationService.navigateTo(Routes.homepageView)
        : print("");
  }

  navigateToLogin() {
    navigationService.navigateTo(Routes.loginView);
  }

  navigateToSignUp() {
    navigationService.navigateTo(Routes.signupView);
  }
}
