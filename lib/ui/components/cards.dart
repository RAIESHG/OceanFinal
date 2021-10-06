import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/ui/components/networkImageRequest/networkImage_view.dart';
import 'package:ocean_publication/ui/screens/details/details_view.dart';
import 'package:ocean_publication/ui/screens/lets_explore/lets_explore_view.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../helpers/colors.dart';
import 'widgets.dart';

class BookCard extends StatelessWidget {
  final BuildContext context;
  final dynamic object;
  const BookCard({Key? key, required this.context, this.object})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService navigationService = locator<NavigationService>();
        navigationService.navigateTo(Routes.detailsObjView,
            arguments: DetailsObjViewArguments(object: object));
      },
      child: Container(
        width: 25.w,
        height: 35.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20.w,
              height: 14.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: NetworkImageC(imgLink: "${object.image}"),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: text(
                object.title ?? "",
                maxLine: 1,
                isCentered: true,
                fontSize: 10.sp,
                fontweight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            // TODO:author rakhnu xa
            // text(
            //   object.author == null ? "":
            //   object.author,
            //   maxLine: 1,
            //   textColor: Colors.grey,
            //   fontweight: FontWeight.w600,
            //   isCentered: true,
            //   fontSize: 10.sp,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            FittedBox(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 10.w,
                    child: text(
                      "${object.price}",
                      // // TODO: change price

                      // "Rs 500", isCentered: true,
                      textColor: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      fontweight: FontWeight.w400,
                      fontSize: 11.sp,
                    ),
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Container(
                    child: text(
                      // "Rs 500",
                      // TODO: REVIEW change offerprice
                      "${object.offerPrice ?? object.price}",
                      textColor: Colors.green,
                      isCentered: true,
                      fontweight: FontWeight.w500,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [1, 2, 3, 4, 5]
                      .map(
                        (e) => Icon(
                          Icons.star,
                          size: 15.0,
                          color: e <= 3 ? Colors.orange : greyColor,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget viewmoreAction(BuildContext context, {VoidCallback? onTapped}) {
  return InkWell(
    onTap: onTapped,
    child: Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          IconWidget(path: categoriesIcon, height: 20.0),
          text(
            "View all",
            fontSize: 20,
          ),
        ],
      ),
    ),
  );
}
