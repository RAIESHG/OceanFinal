import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/searchResponse/searchResponse.dart';
import 'package:ocean_publication/ui/components/search/search_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BaseViewModel {
  SearchRepository _homepageRepository = SearchRepository();
  SearchModel? _homepageResponse;
  NavigationService navigationService = locator<NavigationService>();
  List activeList = [];
  var homepageData;
  Future<void> getHomepageData(String searchTerm) async {
    setBusyForObject("object", true);
    try {
      _homepageResponse = await _homepageRepository.getSearchData(searchTerm);
      homepageData = _homepageResponse!.data;
      activeList = _homepageResponse!.data!;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    setBusyForObject("object", false);
    // notifyListeners();
  }

  void changeActiveList(int id) async {
    activeList.clear();
    if (id == 0) {
      activeList.addAll(homepageData.books);
    } else if (id == 1) {
      activeList.addAll(homepageData.video);
    } else {
      activeList.addAll(homepageData.packages);
    }
    notifyListeners();
  }

  navigateToCartView() {
    navigationService.navigateTo(Routes.cartView);
  }
}
