import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/ui/screens/details/detailsViewModel.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class DetailsObjView extends StatelessWidget {
  final dynamic object;
  const DetailsObjView({Key? key, required this.object}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //TODO: display descriptions,details,reviews etc.
    return ViewModelBuilder<DetailViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: appBarWithSearch(
                context,
                title: "Half-girlfriend",
              ),
              body: SingleChildScrollView(
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.start,
                  direction: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              height: 25.h,
                              width: 25.w,
                              child: Networkimage(
                                  url: object.image ?? "", fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(
                                object.title ?? "",
                                isCentered: false,
                                maxLine: 2,
                                fontweight: FontWeight.w700,
                                fontSize: 13.sp,
                              ),
                              SizedBox(height: 0.8.h),
                              text(
                                object is PackageData
                                    ? ""
                                    : object.author ?? "",
                                isCentered: false,
                                maxLine: 2,
                                textColor: greyColor,
                                fontSize: 15,
                              ),
                              SizedBox(height: 1.h),
                              text(
                                "MRP: ${object.price == 0 ? "" : object.price ?? "--"}",
                                isCentered: true,
                                textColor: blackColor,

                                // decoration: TextDecoration.lineThrough,
                                fontweight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  text(
                                    "Offer Price:  ",
                                    textColor: Colors.red.shade500,
                                    isCentered: true,
                                    maxLine: 1,
                                    fontweight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                  text(
                                    "${object.offerPrice == 0 ? "" : object.offerPrice ?? ""}",
                                    textColor: blackColor,
                                    isCentered: true,
                                    maxLine: 1,
                                    fontweight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),

                              text(
                                "Stock Available",
                                textColor: colorPrimary,
                                isCentered: true,
                                maxLine: 2,
                                fontweight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                              ),

                              SizedBox(height: 2.h),
                              // 20.heightBox,
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //
                                  model.busy("save") == true
                                      ? CircularProgressIndicator()
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: InkWell(
                                            onTap: () {
                                              model.saveCourse(
                                                  courseId:
                                                      object.id.toString(),
                                                  bookName: object.title!);
                                            },
                                            child: Container(
                                              height: 35.0,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.5,
                                              padding: EdgeInsets.all(2.0),
                                              color: Colors.red,
                                              child: Center(
                                                child: text(
                                                  "Save",
                                                  textColor: whiteColor,
                                                  isCentered: true,
                                                  // maxLine: 1,
                                                  height: 1.0,
                                                  fontweight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                  SizedBox(
                                    width: 2.w,
                                  ),

                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: InkWell(
                                      onTap: () async {
                                        model.addToCart(object);
                                      },
                                      child: Container(
                                        height: 35.0,
                                        // width: context.screenWidth / 4.5,
                                        padding: EdgeInsets.all(2.0),
                                        color: Colors.orange,
                                        child: Center(
                                          child: text(
                                            "Add to Cart",
                                            textColor: whiteColor,
                                            isCentered: true,
                                            // maxLine: 1,
                                            height: 1.0,
                                            fontweight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: greyColor,
                                  ),
                                  borderRadius: borderRadius(),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: text("Specifications"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      initialIndex: 0,
                      length: 3,
                      child: Column(
                        // direction: Axis.vertical,
                        children: [
                          TabBar(
                            onTap: (int indx) {
                              model.changeValue(indx);
                            },
                            labelColor: colorPrimary,
                            unselectedLabelColor: Colors.black,
                            tabs: model.tabBarTitles.map(
                              (String title) {
                                int elementIndex =
                                    model.tabBarTitles.indexOf(title);
                                return Tab(
                                  child: text(
                                    "$title",
                                    textColor: model.activeIndex == elementIndex
                                        ? colorPrimary
                                        : Colors.black,
                                    isCentered: true,
                                    maxLine: 2,
                                    fontweight:
                                        model.activeIndex == elementIndex
                                            ? FontWeight.w600
                                            : null,
                                    fontSize: model.activeIndex == elementIndex
                                        ? 18.0
                                        : 16.0,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          Container(
                            height: 50.h,
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Container(
                                  
                                        height: 10.h,
                                        // width: 20.w,
                                        
                                       child: Html(
                                        data: object.description ??
                                            "<head>No Data Available</head>"),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.all(10.0),
                                      //   child: packageContainer(context, "Recommended books"),
                                      // ),
                                    ],
                                  ),
                                ),
                                object is PackageData
                                    ? Container()
                                    : Html(
                                        data: object.tableOfContent ??
                                            "<head>adadadad</head>"),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3 -
                                          100,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => DetailViewModel());
  }
}
