import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/authors/authors.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_packageResponse.dart';
import 'package:ocean_publication/ui/screens/authors/author_profile_view.dart';
import 'package:ocean_publication/ui/screens/cart/cart_view.dart';
import 'package:ocean_publication/ui/screens/cart/cart_viewmodel.dart';
import 'package:ocean_publication/ui/screens/checkout/checkout_view.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../helpers/colors.dart';
import '../../helpers/extensions.dart';
import 'package:sizer/sizer.dart';

class StackedElevatedImage extends StatelessWidget {
  final Widget? detailsWidget;
  final double? height;
  final String? image;

  StackedElevatedImage({Key? key, this.detailsWidget, this.height, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.168,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.32),
                child: Card(
                  elevation: 5,
                                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.015),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02),
                      child: detailsWidget,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.29,
                  height: MediaQuery.of(context).size.height * 0.18,
                  color: Colors.white,
                  child: FadeInImage(
                    image: NetworkImage("$image"),
                    // image: NetworkImage(image!.contains('https://oceanpublication.com.np/')
                    //                 ? image ?? ""
                    //                 : "https://oceanpublication.com.np/$image",),
                    // memCacheHeight: 200,
                    // imageUrl: "$imgLink",
                    placeholder: AssetImage("assets/icons/placeholder.png"),
                    //  (context, url) => SpinKitWave(
                    //   color: colorPrimary,
                    //   itemCount: 8,
                    // ),
                    // errorWidget: (context, error, stackTrace) {
                    //   return SpinKitWave(
                    //     color: colorPrimary,
                    //     itemCount: 8,
                    //   );
                    // },
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stackedDetailsView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.24,
      child: Stack(
        children: [
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.168,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.015),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25),
                  child: detailsWidget,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 10.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.34,
                height: MediaQuery.of(context).size.height * 0.18,
                color: Colors.white,
                child: FadeInImage(
                  image: NetworkImage(
                    image!.contains('https://oceanpublication.com.np/')
                        ? image ?? ""
                        : "https://oceanpublication.com.np/$image",
                  ),
                  // memCacheHeight: 200,
                  // imageUrl: "$imgLink",
                  placeholder: AssetImage("assets/icons/placeholder.png"),
                  //  (context, url) => SpinKitWave(
                  //   color: colorPrimary,
                  //   itemCount: 8,
                  // ),
                  // errorWidget: (context, error, stackTrace) {
                  //   return SpinKitWave(
                  //     color: colorPrimary,
                  //     itemCount: 8,
                  //   );
                  // },
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned detailsContainer(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 10.0,
      child: Container(
        //Inner container5
        // width: context.screenWidth * 0.75,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10
              // context.screenWidth * 0.025
              ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            //just empty container to maintain alignment of row
            Container(
              width: 10,
              height: 20.0,
            ),
            detailsWidget ?? Container(),
          ],
        ),
        //inner Container
      ),
    );
  }
}

class BookDetailsWidgetForElevatedDisplay extends StatelessWidget {
  final dynamic item;

  const BookDetailsWidgetForElevatedDisplay({Key? key, required this.item})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 10.w,
      padding: EdgeInsets.all(4.0),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //
            text(
              item.title, fontweight: FontWeight.w600, fontSize: 13.sp,
              // fontSize: context.textTheme.subtitle1!.fontSize,
            ),
            SizedBox(
              height: 2.h,
            ),
            text(
              item is PackageDatum ? "" : item.author,
              textColor: Colors.grey,
              fontweight: FontWeight.w300,
              fontSize: 14.sp,
              // fontSize: context.textTheme.caption!.fontSize,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                text("${item.price}".toCurrency,
                    textColor: greyColor,
                    fontweight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14.sp
                    // fontSize: context.textTheme.subtitle1!.fontSize,
                    ),
                SizedBox(
                  width: 5.w,
                ),
                text("${item.offerPrice ?? "" }",
                    textColor: blackColor,
                    fontweight: FontWeight.w500,
                    fontSize: 12.sp
                    // fontSize: context.textTheme.subtitle1!.fontSize,
                    ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                //
          

                ActionButton(
                  title: "View",
                  color: Colors.orange,
                  // width: context.screenWidth * 0.2,
                  onTapped: () async {
                    NavigationService navigationService =
                        locator<NavigationService>();
                    navigationService.navigateTo(Routes.checkoutView,
                        arguments: CheckoutViewArguments(item: item));
                  },
                ),
                SizedBox(
                  width: 2.w,
                ),
                ActionButton(
                  title: "Add to cart",
                  color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.3,
                  onTapped: () async {
                    await CartViewModel().addToCart(item);
                    NavigationService navigationService =
                        locator<NavigationService>();
                    navigationService.navigateTo(Routes.cartView);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavigateToAuthorProfileButton extends StatelessWidget {
  final AuthorData? _authorData;

  NavigateToAuthorProfileButton(this._authorData);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          // top: context.screenWidth * 0.07,
          // bottom: context.screenWidth * 0.02,
          ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            // width: context.screenWidth * 0.4,
            child: text("${_authorData!.name}",
                isCentered: true, fontweight: FontWeight.w700, fontSize: 10
                // fontSize: context.textTheme.headline6!.fontSize,
                ),
          ),
          // 10.heightBox,
          ActionButton(
            onTapped: () {
              print("go to view profile");
              NavigationService navigationService =
                  locator<NavigationService>();
              navigationService.navigateTo(Routes.authorProfileView,
                  arguments:
                      AuthorProfileViewArguments(authorData: _authorData!));
            },
            title: "View Profile",
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color? color;
  final String? title;
  final VoidCallback? onTapped;
  final double? height;
  final double? width;
  final bool? showRadius;
  ActionButton(
      {Key? key,
      this.color,
      this.title,
      this.onTapped,
      this.height,
      this.width,
      this.showRadius = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: 4.5.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: color ?? colorPrimary,
          borderRadius:
              showRadius! ? BorderRadius.circular(2) : BorderRadius.zero,
        ),
        child: Center(
          child: text("$title",
              fontweight: FontWeight.w600,
              isCentered: true,
              textColor: whiteColor,
              fontSize: 12.sp),
        ),
      ),
    );
  }
}
