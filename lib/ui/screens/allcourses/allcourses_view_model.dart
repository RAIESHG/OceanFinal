import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/allCourses/allCoursesReponse.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllCoursesViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  AllCourseData? allCourseData;
  List courses = [];
  Future<void> allCourse() async {
    setBusyForObject("object", true);
    var response = await getRequest("/all-course");
    allCourseData = allCoursesResponseFromJson(response.body).data;

    allCourseData!.books != null
        ? courses = [...allCourseData!.books!.map((e) => e)]
        : Container();
    allCourseData!.videos != null
        ? courses = [...allCourseData!.videos!.map((e) => e), ...courses]
        : Container();

    allCourseData!.packages != null
        ? courses = [...allCourseData!.packages!.map((e) => e), ...courses]
        : Container();

    print(courses);

    setBusyForObject("object", false);
    notifyListeners();
  }

  navigateToAbout(AllCourseData data) {
    navigationService.navigateTo(Routes.aboutBookView,
        arguments: AboutBookViewArguments(object: data));
  }
}
