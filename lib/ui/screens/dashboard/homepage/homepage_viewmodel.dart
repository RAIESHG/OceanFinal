import 'package:flutter/material.dart';
import 'package:ocean_publication/model/homepageBannerResponse/homepageBannerResponse.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/model/choice.dart';
import 'package:ocean_publication/ui/screens/dashboard/homepage/homepage_repository.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:stacked/stacked.dart';

class HomepageViewmodel extends BaseViewModel {
  HomepageRepository _homepageRepository = HomepageRepository();
  HomepageResponse? _homepageResponse;
  HomepageBannerResponse? _homepageBannerResponse;
  int selectedIndex = 0;
  int navBarIndex = 0;
  List bannerImageList = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List activeList = [];
  HomepageData? homepageData;
  Future<void> getHomepageData() async {
    setBusy(true);
    try {
      _homepageResponse = await _homepageRepository.getHomepageData();
      homepageData = _homepageResponse!.data;
      _homepageBannerResponse = await _homepageRepository.getBanner();
      getBannerImageList();
      changeActiveList(0);
    } catch (e) {
      print(e.toString());
    }
    setBusy(false);
    notifyListeners();
  }

  getBannerImageList() {
    bannerImageList = [..._homepageBannerResponse!.data!.map((e) => e.image)];
  }

  List<Choice> choices = [
    Choice(id: 0, title: "Book", icon: bookIcon),
    Choice(id: 1, title: "Video", icon: videoIcon),
    Choice(id: 2, title: "Package", icon: packageIcon),
  ];
  void changeActiveList(int id) async {
    activeList.clear();
    if (id == 0) {
      activeList.addAll([homepageData!.books!]);
    } else if (id == 1) {
      activeList.addAll([homepageData!.video]);
    } else {
      activeList.addAll([homepageData!.packages]);
    }
    // notifyListeners();
  }

  void onchanged(var e, var choices) {
    selectedIndex = choices.indexOf(e);

    changeActiveList(selectedIndex);
    notifyListeners();
  }

    bool isElevated = true;
  bool showViewmore = true;
}
