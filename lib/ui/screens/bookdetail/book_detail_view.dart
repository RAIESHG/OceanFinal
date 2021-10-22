import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/screens/bookdetail/bok_details_view_model.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';

import 'package:stacked/stacked.dart';


class BookDetailView extends StatelessWidget {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookdetailsViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: appBarWithSearch(context),
            body: Center(
              child: Container(
                // padding: EdgeInsets.all(context.screenWidth * 0.05),
                // width: context.screenWidth * 0.95,
                // height: context.screenHeight,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      FittedBox(
                        child: StackedElevatedImage(
                          detailsWidget:
                              LayoutBuilder(builder: (context, constraints) {
                            return Container(
                              padding:
                                  EdgeInsets.all(constraints.maxWidth * 0.05),
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      "Book name",
                                      fontweight: FontWeight.w600,
                                      fontSize: 10,
                                    ),
                                    text(
                                      "5 Reviews",
                                      textColor: greyColor,
                                      fontweight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                    Row(
                                      children: [1, 2, 3, 4, 5]
                                          .map((e) => Icon(
                                                Icons.star,
                                                size: 15.0,
                                                color: e <= 3
                                                    ? Colors.orange
                                                    : greyColor,
                                              ))
                                          .toList(),
                                    ),
                                    // 5.heightBox,
                                    ActionButton(
                                      title: "Read now",
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      // 15.heightBox,
                      // headingAndDetail(context, title: "About the book"),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              // height: context.screenWidth * 0.15,
                              // width: context.screenWidth,
                              padding: EdgeInsets.only(left: 15.0),
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: borderRadius(),
                              ),
                              alignment: Alignment.centerLeft,
                              child: text(
                                "About the Book",
                                textColor: whiteColor,
                                fontweight: FontWeight.w600,
                                // fontSize: context.textTheme.headline6!.fontSize,
                              ),
                            ),
                            // 10.heightBox,
                            if (model.isfeedback == true) ...[
                              Container(
                                // width: context.screenWidth * 0.95,
                                padding: EdgeInsets.all(5.0),
                                child: text(
                                  "The quick brown fox jumps over little lazy dog is very poor jhgjhg" *
                                      20,
                                  maxLine: 50,
                                  // fontSize: context.textTheme.subtitle2!.fontSize,
                                ),
                              ),
                            ],
                            if (model.isfeedback == true) ...[
                              Column(
                                children: [
                                  textField(
                                    hintText:
                                        "Share your views about this book",
                                    maxLines: 6,
                                  ),
                                  // 5.heightBox,
                                  ActionButton(
                                    title: "Submit",
                                    showRadius: true,
                                  )
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      // 15.heightBox,
                      Container(
                        child: Column(
                          children: [
                            Container(
                              // height: context.screenWidth * 0.15,
                              // width: context.screenWidth,
                              padding: EdgeInsets.only(left: 15.0),
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: borderRadius(),
                              ),
                              alignment: Alignment.centerLeft,
                              child: text(
                                "How to read it?",
                                textColor: whiteColor,
                                fontweight: FontWeight.w600,
                                // fontSize: context.textTheme.headline6!.fontSize,
                              ),
                            ),
                            // 10.heightBox,
                            if (model.isfeedback == true) ...[
                              Container(
                                // width: context.screenWidth * 0.95,
                                padding: EdgeInsets.all(5.0),
                                child: text(
                                  "The quick brown fox jumps over little lazy dog is very poor jhgjhg" *
                                      20,
                                  maxLine: 50,
                                  // fontSize: context.textTheme.subtitle2!.fontSize,
                                ),
                              ),
                            ],
                            if (model.isfeedback == true) ...[
                              Column(
                                children: [
                                  textField(
                                    hintText:
                                        "Share your views about this book",
                                    maxLines: 6,
                                  ),
                                  // 5.heightBox,
                                  ActionButton(
                                    title: "Submit",
                                    showRadius: true,
                                  )
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),

                      // 15.heightBox,
                      Container(
                        child: Column(
                          children: [
                            Container(
                              // height: context.screenWidth * 0.15,
                              // width: context.screenWidth,
                              padding: EdgeInsets.only(left: 15.0),
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: borderRadius(),
                              ),
                              alignment: Alignment.centerLeft,
                              child: text(
                                "FeedBack",
                                textColor: whiteColor,
                                fontweight: FontWeight.w600,
                                // fontSize: context.textTheme.headline6!.fontSize,
                              ),
                            ),
                            // 10.heightBox,
                            if (model.isfeedback == true) ...[
                              Container(
                                // width: context.screenWidth * 0.95,
                                padding: EdgeInsets.all(5.0),
                                child: text(
                                  "The quick brown fox jumps over little lazy dog is very poor jhgjhg" *
                                      20,
                                  maxLine: 50,
                                  // fontSize: context.textTheme.subtitle2!.fontSize,
                                ),
                              ),
                            ],
                            if (model.isfeedback == true) ...[
                              Column(
                                children: [
                                  textField(
                                    hintText:
                                        "Share your views about this book",
                                    maxLines: 6,
                                  ),
                                  // 5.heightBox,
                                  ActionButton(
                                    title: "Submit",
                                    showRadius: true,
                                  )
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => BookdetailsViewModel());
  }
}
