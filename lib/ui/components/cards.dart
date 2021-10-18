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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ClipRRect(
                  child: NetworkImageC(imgLink: "${object.image}"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: 25.w,
                child: text(
                  object.title ?? "",
                  maxLine: 6,
                  isCentered: true,
                  fontSize: 8.sp,
                  fontweight: FontWeight.w700,
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.01,
              // ),
         
              object is PackageData
                  ? Container()
                  : Container(
                      width: 20.w,
                      margin: const EdgeInsets.only(top: 5.0),
                      child: text(
                        object.author,
                        maxLine: 1,
                        textColor: Colors.grey,
                        fontweight: FontWeight.w600,
                        isCentered: true,
                        fontSize: 6.sp,
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FittedBox(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 10.w,
                      child: object.price == 0
                          ? text("")
                          : text(
                              "${object.price ?? ""}",
                              // // TODO: change price

                              // "Rs 500", isCentered: true,
                              textColor: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              fontweight: FontWeight.w400,
                              fontSize: 9.sp,
                            ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Container(
                      child: text(
                        // "Rs 500",
                        // TODO: REVIEW change offerprice
                        "${object.offerPrice == 0 ? "" : object.offerPrice ?? ""}",
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
                height: MediaQuery.of(context).size.height * 0.01,
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
            fontSize: 12.sp,
          ),
        ],
      ),
    ),
  );
}
