import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:ocean_publication/ui/screens/allcourses/allcourses_view.dart';
import 'package:ocean_publication/ui/screens/authentication/auth_presenter.dart';
import 'package:ocean_publication/ui/screens/authors/authors_view.dart';
import 'package:ocean_publication/ui/screens/dashboard/dashboard_view.dart';
import 'package:ocean_publication/ui/screens/distributors/distributors_view.dart';
import 'package:ocean_publication/ui/screens/history/history_view.dart';
import 'package:ocean_publication/ui/screens/lets_explore/lets_explore_view.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/ui/screens/profile/view_profile/profile_view.dart';
import 'package:ocean_publication/ui/screens/saveCourses/saved_course_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerViewModel extends BaseViewModel {
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  NavigationService navigationService = locator<NavigationService>();
  bool checkLogin = false;
  final List<String> categories = [
    'Book',
    'Video',
    'Package',
    'Distributors',
    'All Courses',
    'Profile',
    'Authors',
    // 'Library',
    // "Dashboard",
    // 'History',
    // 'Profile',
    'History',
    'Dashboard',
    'Saved Courses',
    'Logout',
  ];
  final List<Widget> navigate = [
    //
    LetsExploreView(type: "book"),
    LetsExploreView(type: "video"),
    LetsExploreView(type: "package"),
    DistributorView(),
    AllCoursesView(),
    ProfileView(),
   
    AuthorsView(),
    HistoryView(),
    DashBoardView(),
    SavedCourseView(),
    AuthPresenter(),
  ];
  final List<IconData> icons = [
    //
    Icons.book,
    Icons.video_camera_front,
    Icons.cases,
    Icons.favorite,
    Icons.golf_course_sharp,
    Icons.person,
    Icons.person_add,
    Icons.history,
    Icons.dashboard,
    Icons.save,
    Icons.logout,

    // bookIcon,
    // videoIcon,
    // packageIcon,
    // favouriteIcon,
    // // settingIcon,
    // libraryIcon,
    // logo,
    // profileIcon,
    // logoutIcon,
    // logoutIcon,
    // logoutIcon,
    // logoutIcon,
  ];

  Future<void> onModelReady() async {
    checkLogin = await await sharedPreferencesService.loginCheck();
    notifyListeners();
  }

  void onLogout() async {
    await sharedPreferencesService.deleteSavedUser();
    navigationService.navigateTo(Routes.authPresenter);
  }
}
