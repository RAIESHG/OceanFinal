import 'dart:convert';

import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/myOrderHistoryResponse.dart/history_reponse.dart';
import 'package:ocean_publication/model/savedCoursesResponse/savedCourseResponse.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SavedCourseViewModel extends BaseViewModel {
  SavedCourseData? savedCourseData;
  SnackbarService snackbarService = locator<SnackbarService>();
  NavigationService navigationService = locator<NavigationService>();
  Future<void> getSavedCourses() async {
    setBusyForObject("object", true);
    var response = await getRequest("/get_save_courses");
    savedCourseData = savedCourseResponseFromJson(response.body).data;
    setBusyForObject("object", false);
    notifyListeners();
  }

  Future<void> deleteSavedCourse(var object) async {
    setBusyForObject("${object.id}", true);
    var response = await postRequest("/delete-course",
        body: {"courseId": object.id.toString(), "name": object.type});

    if (json.decode(response.body)["status"] == "true") {
      snackbarService.showSnackbar(message: "Deleted Saved Course");
      // navigationService.clearTillFirstAndShow(Routes.savedCourseView);
      // navigationService.popUntil((route) => true);
      navigationService.pushNamedAndRemoveUntil(Routes.homepageView);
    } else {
      snackbarService.showSnackbar(
          message: "Error Occured Please Try Again Later");
    }
    setBusyForObject("${object.id}", false);
    notifyListeners();
  }
}
