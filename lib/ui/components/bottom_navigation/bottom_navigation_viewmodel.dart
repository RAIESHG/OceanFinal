import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomNavigationViewModel extends BaseViewModel {
  var _navBarIndex;
  NavigationService navigationService = locator<NavigationService>();

  onPageChange(int index) {
    // change page
    if (index == 0) {
      navigationService.clearStackAndShow(Routes.homepageView);
    } else if (index == 1) {
      navigationService.navigateTo(Routes.searchView);
    } else if (index == 2) {
      navigationService.navigateTo(Routes.profileView);
    } else if (index ==2) {
      navigationService.navigateTo(Routes.profileView);
    }
    _navBarIndex = index;
  }
}
