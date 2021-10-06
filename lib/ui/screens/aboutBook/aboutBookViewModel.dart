import 'package:flutter/cupertino.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AboutBookViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  TextEditingController feedbackController = TextEditingController();
  SnackbarService snackbarService = locator<SnackbarService>();
  navigateToPdf(String url) {
    navigationService.navigateTo(Routes.pdfView,
        arguments: PdfViewArguments(url: url));
  }

  Future<void> sendFeedBack(var object) async {
    setBusyForObject("object", true);
    var response = await postRequest("/feedback", body: {
      "courseId": object.id,
      "name": object.type,
      "rating": "3",
      "review": feedbackController.text
    });
    if (response.statusCode == 200) {
      snackbarService.showSnackbar(
          message: "Thankyou for the feedback", title: "FeedBack Recieved");
    } else {
      snackbarService.showSnackbar(
          message: "Please Try Again Later", title: "Error");
    }
    setBusyForObject("object", false);
    notifyListeners();
  }
}
