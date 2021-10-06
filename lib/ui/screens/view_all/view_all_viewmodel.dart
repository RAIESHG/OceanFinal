import 'package:flutter/material.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_response.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:stacked/stacked.dart';

class ViewAllViewmodel extends BaseViewModel {
  late BuildContext context;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ViewallResponse? _viewAllResponse;
  ViewAllData? results;
  List<dynamic> items = [];
  int? expandedTile;
  int? childExpandedTile;
  String datatype = "";
  Future<void> getAllData(Object type, BuildContext context) async {
    this.context = context;
    //
    setBusyForObject("object", true);

    if (type is BookData) {
    } else if (type is VideoData) {
    } else {}
    type is BookData
        ? datatype = "books"
        : type is VideoData
            ? datatype = "videos"
            : datatype = "packages";
    ;
    var response = await getRequest('/$datatype');
    print("${response.body}");
    _viewAllResponse = viewAllResponseFromMap(response.body);
    results = _viewAllResponse!.data;
    items = results!.items!;
    setBusyForObject("object", false);
    notifyListeners();
  }

  void changeActiveActegory(int categoryId) {
    items = [];
    print("Hamro${categoryId}");
    for (int i = 0; i < results!.items!.length; i++) {
      print("${results!.items![i].categoryId} IITTEEMMSS");
    }

    if (categoryId == null) {
      items.addAll([results!.items]);
    } else {
      results!.items!.forEach(
        (e) {
          if (e.categoryId == categoryId) {
            print("${e.title},${e.categoryId} ==> $categoryId");
            items.add(e);
          } else {
            //
          }
        },
      );
    }
    print(items.length);
    notifyListeners();
  }
}
