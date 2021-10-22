import 'package:flutter/material.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_bookResponse.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_packageResponse.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_response.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_videoResponse.dart';
import 'package:stacked/stacked.dart';

class ViewAllViewmodel extends BaseViewModel {
  late BuildContext context;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic? _viewAllResponse;
  dynamic? results;
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

    if (type is BookData) {
      _viewAllResponse = viewAllBookResponseFromMap(response.body);

      results = _viewAllResponse!.data;
        items = results!.books!;
    } else if (type is VideoData) {
      _viewAllResponse = viewAllVideoResponseFromMap(response.body);
       results = _viewAllResponse!.data;
        items = results!.videoData!;
    }
     else if (type is PackageData) {
      _viewAllResponse = viewAllPackageResponseFromMap(response.body);
       results = _viewAllResponse!.data;
        items = results!.packageData!;
    }
    

    setBusyForObject("object", false);
    notifyListeners();
  }

  void changeActiveActegory(int categoryId) {
    items = [];
    print("Hamro${categoryId}");

    
    for (int i = 0; i < results!.books!.length; i++) {
      print("${results!.books![i].categoryId} IITTEEMMSS");
    }

    if (categoryId == null) {
      items.addAll([results!.books]);
    } else {
      results!.books!.forEach(
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
