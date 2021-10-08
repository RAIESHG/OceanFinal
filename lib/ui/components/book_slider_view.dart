import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/components/book_slider_view_model.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/dashboard/homepage/homepage_viewmodel.dart';

import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';

class BooKSlider extends ViewModelWidget<HomepageViewmodel> {
  final BuildContext context;
  final dynamic object;
  final Color? bgColor;

  const BooKSlider({Key? key, required this.context, this.object, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context, HomepageViewmodel model) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Card(
        // ignore: dead_code
        elevation: 10.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            Container(
                              width: 80.w,
                              height: 5.h,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: model.choices.map(
                                  (e) {
                                    return InkWell(
                                      onTap: () {
                                        model.onchanged(e, model.choices);
                                        if (model.selectedIndex ==
                                            model.choices.indexOf(e)) {
                                        } else {}
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: model.selectedIndex ==
                                                    model.choices.indexOf(e)
                                                ? colorPrimary
                                                : whiteColor,
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01),
                                            border: Border.all(
                                                color: colorPrimary)),
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconWidget(
                                                path: e.icon ?? "",
                                                height: 3.h,
                                                color: model.selectedIndex ==
                                                        model.choices.indexOf(e)
                                                    ? whiteColor
                                                    : colorPrimary,
                                              ),
                                              SizedBox(width: 1.h),
                                              text(
                                                e.title ?? "",
                                                fontweight: FontWeight.w500,
                                                textColor: model
                                                            .selectedIndex ==
                                                        model.choices.indexOf(e)
                                                    ? whiteColor
                                                    : colorPrimary,
                                                fontSize: 12.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            // viewmoreAction(context),
                          ],
                        ),
                      ),
                    ),
                    // child: Container(
                    //   width: 80.w,
                    //   height: 5.h,
                    //   // alignment: Alignment.center,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: model.choices.map(
                    //       (e) {
                    //         return InkWell(
                    //           onTap: () {
                    //             model.onchanged(e, model.choices);
                    //             if (model.selectedIndex ==
                    //                 model.choices.indexOf(e)) {
                    //             } else {}
                    //           },
                    //           child: Container(
                    //             width:
                    //                 MediaQuery.of(context).size.width / 4.5,
                    //             alignment: Alignment.center,
                    //             decoration: BoxDecoration(
                    //                 color: model.selectedIndex ==
                    //                         model.choices.indexOf(e)
                    //                     ? colorPrimary
                    //                     : whiteColor,
                    //                 borderRadius: BorderRadius.circular(
                    //                     MediaQuery.of(context).size.width *
                    //                         0.01),
                    //                 border:
                    //                     Border.all(color: colorPrimary)),
                    //             child: FittedBox(
                    //               fit: BoxFit.fitWidth,
                    //               child: Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceEvenly,
                    //                 children: [
                    //                   IconWidget(
                    //                     path: e.icon ?? "",
                    //                     height: 3.h,
                    //                     color: model.selectedIndex ==
                    //                             model.choices.indexOf(e)
                    //                         ? whiteColor
                    //                         : colorPrimary,
                    //                   ),
                    //                   SizedBox(width: 1.h),
                    //                   text(
                    //                     e.title ?? "",
                    //                     fontweight: FontWeight.w500,
                    //                     textColor: model.selectedIndex ==
                    //                             model.choices.indexOf(e)
                    //                         ? whiteColor
                    //                         : colorPrimary,
                    //                     fontSize: 10.sp,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ).toList(),
                    //   ),
                    // ),
                  ),
                  if (model.showViewmore)
                    viewmoreAction(
                      context,
                      onTapped: () {
                        NavigationService navigationService =
                            locator<NavigationService>();
                        navigationService.navigateTo(Routes.viewAllView,
                            arguments: ViewAllViewArguments(
                                type: object.data.first ?? ""));
                      },
                    ),

                  // Expanded(
                  //   flex: 1,
                  //   child: viewmoreAction(context),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                      "${object.heading ?? ""}",
                      fontweight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    // if (model.showViewmore)
                    //   viewmoreAction(
                    //     context,
                    //     onTapped: () {
                    //       NavigationService navigationService =
                    //           locator<NavigationService>();
                    //       navigationService.navigateTo(Routes.viewAllView,
                    //           arguments: ViewAllViewArguments(
                    //               type: object.data.first ?? ""));
                    //     },
                    //   ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    object.data.length,
                    (index) => BookCard(
                      context: context,
                      object: object.data[index],
                    ),
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






// class BookSlider extends StatelessWidget {
//   final BuildContext context;
//   final dynamic object;
//   final Color? bgColor;

//   const BookSlider({Key? key, required this.context, this.object, this.bgColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
  
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.0),
//       child: Card(
//         // ignore: dead_code
//         elevation: isElevated ? 10.0 : 0.0,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(5.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
              
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     text(
//                       "${object.heading ?? ""}",
//                       fontweight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                     SizedBox(
//                       height: 6.h,
//                     ),
//                     if (showViewmore)
//                       viewmoreAction(
//                         context,
//                         onTapped: () {
//                           NavigationService navigationService =
//                               locator<NavigationService>();
//                           navigationService.navigateTo(Routes.viewAllView,
//                               arguments: ViewAllViewArguments(
//                                   type: object.data.first ?? ""));
//                         },
//                       ),
//                   ],
//                 ),
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     object.data.length,
//                     (index) => BookCard(
//                       context: context,
//                       object: object.data[index],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
