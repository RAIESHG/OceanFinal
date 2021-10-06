// import 'package:flutter/material.dart';
// import 'package:ocean_publication/model/searchResponse/searchResponse.dart';

// import 'package:stacked/stacked.dart';

// import 'search_repository.dart';

// class SearchViewModel extends BaseViewModel {
//   int navBarIndex = 0;
//   int selectedIndex = 0;

//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   SearchRepository _homepageRepository = SearchRepository();

//   SearchModel? _homepageResponse;
//   List activeList = [];
//   var homepageData;
//   Future<void> getHomepageData(String searchTerm) async {
//     setBusy(true);
//     try {
//       _homepageResponse = await _homepageRepository.getSearchData(searchTerm);
//       homepageData = _homepageResponse!.data;

//       activeList = _homepageResponse!.data!;
//       notifyListeners();
//     } catch (e) {
//       print(e.toString());
//     }
//     setBusy(false);
//     notifyListeners();
//   }

//   void changeActiveList(int id) async {
//     activeList.clear();
//     if (id == 0) {
//       activeList.addAll(homepageData.books);
//     } else if (id == 1) {
//       activeList.addAll(homepageData.video);
//     } else {
//       activeList.addAll(homepageData.packages);
//     }
//     notifyListeners();
//   }
// }
