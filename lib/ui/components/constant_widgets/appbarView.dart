import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/screens/cart/cart_view.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:stacked_services/stacked_services.dart';

AppBar appBarWithSearch(BuildContext context,
        {TextTheme? theme, String? title}) =>
    AppBar(
      backgroundColor: Colors.blue.shade700,
      centerTitle: true,
      // title: Text(
      //   "$title",
      //   style: TextStyle(
      //     fontSize: theme.headline6.fontSize,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
      title: Container(
        height: 40.0,
        padding: EdgeInsets.only(
          bottom: 5.0,
        ),
        alignment: Alignment.topCenter,
        child: TextField(
          onTap: () {
            NavigationService navigationService = locator<NavigationService>();
            navigationService.navigateTo(Routes.searchView);
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
            contentPadding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
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

                NavigationService navigationService =
                    locator<NavigationService>();
                navigationService.navigateTo(Routes.cartView);
              },
              child: Icon(Icons.shopping_cart)),
        ),
      ],
    );
