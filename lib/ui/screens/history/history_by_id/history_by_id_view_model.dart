import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/myOrderHistoryResponse.dart/historyId_response.dart';
import 'package:ocean_publication/model/myOrderHistoryResponse.dart/history_reponse.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryByIdViewModel extends BaseViewModel {
  HistoryIdData? historyData;
  NavigationService navigationService = locator<NavigationService>();
  Future<void> getHistory(int id) async {
    setBusyForObject("object", true);
    // await getUser();
    //
    var response = await getRequest("/myOrders/$id");
    historyData = historyIdResponseFromJson(response.body).data;
    setBusyForObject("object", false);

    notifyListeners();
  }

  navigateToPdfView(String url) {
    navigationService.navigateTo(Routes.pdfView,
        arguments: PdfViewArguments(url: url));
  }
}
