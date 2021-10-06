import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBarViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  onCartTap() {
    navigationService.navigateTo(Routes.cartView);
  }
}
