import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/model/dashboardResponse/dashboardResponse.dart';
import 'package:ocean_publication/model/myOrderHistoryResponse.dart/history_reponse.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  DashBoardData? dashBoardData;
  Future<void> getDashboardData() async {
    setBusyForObject("object", true);
    // await getUser();
    //

    var response = await getRequest("/dashboard");
    dashBoardData = dashboardResponseFromJson(response.body).data;
    setBusyForObject("object", false);

    notifyListeners();
  }

  // navigateToHistoryId(int id) {
  //   navigationService.navigateTo(Routes.historyByIdView,arguments: HistoryByIdViewArguments(id: id));
  // }
}
