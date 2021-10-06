import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/authResponse/authresponse.dart';
import 'package:ocean_publication/model/item/item.dart';
import 'package:ocean_publication/model/letsExplore/lets_explore.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:stacked/stacked.dart';

class LetsExploreViewmodel extends BaseViewModel {
  AuthResponse? _authResponse;
  LetsExploreData? letsExploreData;
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  User? user;
  Item? item;
  Future<void> getUserAndToken() async {
    _authResponse = await sharedPreferencesService.getCachedUser();
    user = _authResponse != null ? _authResponse!.user : null;
    notifyListeners();
  }

  Future<void> getAllItems(String itemTitle) async {
    setBusyForObject("object", true);
    await getUserAndToken();
    var response = await getRequest("/letsexplore/$itemTitle");
    letsExploreData = letsExploreResponseFromMap(response.body).data;
    notifyListeners();
    setBusyForObject("object", false);
  }
}
