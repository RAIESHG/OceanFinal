import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/myOrderHistoryResponse.dart/history_reponse.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ocean_publication/app/app.router.dart';

class HistoryViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  
  List<HistoryData?>? historyData;
  Future<void> getHistory() async {
    setBusyForObject("object", true);
    // await getUser();
    //
    var response = await getRequest("/myOrders");
    historyData = historyResponseFromJson(response.body).data;
    setBusyForObject("object", false);

    notifyListeners();
  }

  navigateToHistoryId(int id) {
    navigationService.navigateTo(Routes.historyByIdView,arguments: HistoryByIdViewArguments(id: id));
  }
}
