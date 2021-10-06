import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomNavigationViewModel extends BaseViewModel {
  var _navBarIndex;
  NavigationService navigationService = locator<NavigationService>();
  SnackbarService snackbarService = locator<SnackbarService>();
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  bool isLogin = false;

  onModelReady() async {
    // isLogin = await isLoggedIn();
  }

  onPageChange(int index) async {
    // change page
    if (index == 0) {
      navigationService.clearStackAndShow(Routes.homepageView);
    } else if (index == 1) {
      isLogin == await isLoggedIn()
          ? snackbarService.showSnackbar(message: "Please Login")
          : navigationService.navigateTo(Routes.profileView);
    } else if (index == 2) {
      isLogin == await isLoggedIn()
          ? snackbarService.showSnackbar(message: "Please Login")
          : navigationService.navigateTo(Routes.profileView);
    } else if (index == 2) {
      isLogin == await isLoggedIn()
          ? snackbarService.showSnackbar(message: "Please Login")
          : navigationService.navigateTo(Routes.profileView);
    }
    _navBarIndex = index;
  }

  Future<bool> isLoggedIn() async {
    return await sharedPreferencesService.loginCheck();
  }
}
