import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/screens/allcourses/allcourses_view_model.dart';
import 'package:ocean_publication/ui/screens/bookdetail/book_detail_view.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllCoursesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllCoursesViewModel>.reactive(
        onModelReady: (AllCoursesViewModel model) {
          model.allCourse();
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: appBarWithSearch(context, title: "All courses"),
            // body: Container(
            //   padding: EdgeInsets.all(5.0),
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         //

            //         ...List.generate(
            //           5,
            //           (index) => StackedElevatedImage(
            //             detailsWidget: detailsWidget(context),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            body: model.busy("object") == true
                ? CircularProgressIndicator()
                : Flex(
                    direction: Axis.vertical,
                    children: [
                      Container(
                        color: whiteColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              "All Courses",
                              fontweight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.filter,
                            //       color: colorPrimary,
                            //     ),
                            //     text(
                            //       "Filter",
                            //       fontweight: FontWeight.w600,
                            //       fontSize: 20,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    
                      Flexible(
                        child: AllCourseCard(
                          object: model.courses,
                        ),
                      ),
                    ],
                  ),
          );
        },
        viewModelBuilder: () => AllCoursesViewModel());
  }
}

class AllCourseCard extends StatelessWidget {
  final dynamic object;
  const AllCourseCard({Key? key, this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: object.length,
        itemBuilder: (BuildContext context, int index) {
          return StackedElevatedImage(
            detailsWidget: LayoutBuilder(
              builder: (context, constraints) => Container(
                child: Container(
                  width: constraints.maxWidth * 0.95,
                  padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        text(
                          "${object[index].title}",
                          fontweight: FontWeight.w600,
                          fontSize: 20.sp,
                          maxLine: 2,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        text(
                          "${object[index].type}",
                          textColor: greyColor,
                          fontweight: FontWeight.w300,
                          fontSize: 18.sp,
                        ),
                        Row(
                          children: [1, 2, 3, 4, 5]
                              .map((e) => Icon(
                                    Icons.star,
                                    size: 15.0,
                                    color: e <= 3 ? Colors.orange : greyColor,
                                  ))
                              .toList(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ActionButton(
                          title: "View",
                          color: Colors.orange,
                          onTapped: () {
                            NavigationService navigationService =
                                locator<NavigationService>();
                            navigationService.navigateTo(Routes.aboutBookView,
                                arguments: AboutBookViewArguments(
                                    object: object[index]));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            image:
                "${object[index].image}",
          );
        });
  }
}
