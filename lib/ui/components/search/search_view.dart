import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/ui/components/search/search_view_model.dart';
import 'package:ocean_publication/ui/screens/cart/cart_view.dart';
import 'package:ocean_publication/ui/components/drawer/drawerView.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/widgets.dart';

import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  int _navBarIndex = 0;
  int selectedIndex = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
        onModelReady: (vm) async {
          await vm.getHomepageData("d");
        },
        builder: (context, model, child) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: DrawerView(),
            appBar: AppBar(
              backgroundColor: Colors.blue.shade700,
              centerTitle: true,
              title: Container(
                height: 40.0,
                padding: EdgeInsets.only(
                  bottom: 5.0,
                ),
                alignment: Alignment.topCenter,
                child: TextField(
                  onChanged: (val) {
                    model.getHomepageData(val);
                  },
                  style: TextStyle(color: colorPrimary, fontSize: 12.0),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 12.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: colorPrimary,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                    hintText: "Search",
                    enabledBorder: outlineInputBorder(radius: 8.0),
                    border: outlineInputBorder(radius: 8.0),
                    focusedBorder: outlineInputBorder(radius: 8.0),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        //apply search
                        print("search");
                      },
                      child: Icon(Icons.search)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        //open bag

                        model.navigateToCartView();
                      },
                      child: Icon(Icons.shopping_cart)),
                ),
              ],
            ),
            backgroundColor: Color(0xffDEDBDB),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: model.isBusy
                    ? [
                        SpinKitWave(
                          color: colorPrimary,
                          itemCount: 8,
                        ),
                      ]
                    : [
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 250,
                                      childAspectRatio: 1 / 1.3,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2),
                              itemCount: model.activeList.length,
                              itemBuilder: (_, i) => BookCard(
                                  context: context,
                                  object: model.activeList[i])),
                        ),
                      ],
              ),
            ),
          );
        },
        viewModelBuilder: () => SearchViewModel());
  }
}

class InnerView {
  final String? name;
  final ScrollController controller = ScrollController();
  InnerView({this.name});
}
