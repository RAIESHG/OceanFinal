import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/ui/components/book_slider_view.dart';
import 'package:ocean_publication/ui/components/bottom_navigation/bottom_navigation_view.dart';
import 'package:ocean_publication/ui/components/imageSlider.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/constants.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/model/choice.dart';
import 'package:ocean_publication/ui/components/drawer/drawerView.dart';
import 'package:ocean_publication/ui/screens/dashboard/homepage/homepage_viewmodel.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:sizer/sizer.dart';

class HomepageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewmodel>.reactive(
        onModelReady: (vm) async {
          await vm.getHomepageData();
        },
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            drawer: DrawerView(),
            appBar: appBarWithSearch(context),
            bottomNavigationBar: BottomNavigationBarView(),
            backgroundColor: Color(0xffDEDBDB),
            body: SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Card(
                            child: ImageSlideShows(
                              imageList: model.bannerImageList,
                            ),
                          ),
                        ),

                        // Padding(
                        //   padding: EdgeInsets.all(5.0),
                        //   child: FittedBox(
                        //     fit: BoxFit.fitWidth,
                        //     child: Row(
                        //       children: [
                        //         Container(

                        //           width: 80.w,
                        //           height: 5.h,
                        //           alignment: Alignment.center,
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceEvenly,
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.center,
                        //             children: model.choices.map(
                        //               (e) {
                        //                 return InkWell(
                        //                   onTap: () {
                        //                     model.onchanged(e, model.choices);
                        //                     if (model.selectedIndex ==
                        //                         model.choices.indexOf(e)) {
                        //                     } else {}
                        //                   },
                        //                   child: Container(
                        //                     width: MediaQuery.of(context)
                        //                             .size
                        //                             .width /
                        //                         4,
                        //                     alignment: Alignment.center,
                        //                     decoration: BoxDecoration(
                        //                         color: model.selectedIndex ==
                        //                                 model.choices
                        //                                     .indexOf(e)
                        //                             ? colorPrimary
                        //                             : whiteColor,
                        //                         borderRadius:
                        //                             BorderRadius.circular(
                        //                                 MediaQuery.of(context)
                        //                                         .size
                        //                                         .width *
                        //                                     0.01),
                        //                         border: Border.all(
                        //                             color: colorPrimary)),
                        //                     child: FittedBox(
                        //                       fit: BoxFit.fitWidth,
                        //                       child: Row(
                        //                         mainAxisAlignment:
                        //                             MainAxisAlignment
                        //                                 .spaceEvenly,
                        //                         children: [
                        //                           IconWidget(
                        //                             path: e.icon ?? "",
                        //                             height: 3.h,
                        //                             color:
                        //                                 model.selectedIndex ==
                        //                                         model.choices
                        //                                             .indexOf(
                        //                                                 e)
                        //                                     ? whiteColor
                        //                                     : colorPrimary,
                        //                           ),
                        //                           SizedBox(width: 1.h),

                        //                           text(
                        //                             e.title ?? "",
                        //                             fontweight:
                        //                                 FontWeight.w500,
                        //                             textColor:
                        //                                 model.selectedIndex ==
                        //                                         model.choices
                        //                                             .indexOf(
                        //                                                 e)
                        //                                     ? whiteColor
                        //                                     : colorPrimary,
                        //                             fontSize: 12.sp,
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 );
                        //               },
                        //             ).toList(),
                        //           ),
                        //         ),
                        //         // viewmoreAction(context),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        if (model.activeList.length > 0)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.8,
                              child: BooKSlider(
                                context: context,
                                object: model.activeList[0],
                              ),
                            ),
                          ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              7, model.activeList.length == 0 ? 12 : 2, 2, 2),
                          child: Container(
                            height: 14.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(authBackgroundImage),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 1.h),
                                Container(
                                    child: Text(
                                  'We have more than thousand books.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                )),
                                SizedBox(height: 2.h),
                                Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: EdgeInsets.only(
                                        bottom: 15.0,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          //
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          width: 50.w,
                                          height: 6.h,
                                          child: Center(
                                            child: text(
                                              'Explore Now',
                                              textColor: colorPrimary,
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              fontweight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (model.activeList.length > 1)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              child: BooKSlider(
                                context: context,
                                object: model.activeList[1],
                              ),
                            ),
                          ),
                      ],
              ),
            ),
          );
        },
        viewModelBuilder: () => HomepageViewmodel());
  }
}

// Widget sliderImage(Banners? banners) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: 10,
//     ),
//     child: Container(
//       height: 10,
//       width: 10,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image:
//           FadeInImage(
//             image: NetworkImage(imgLink),
//             // memCacheHeight: 200,
//             // imageUrl: "$imgLink",
//             placeholder: AssetImage("assets/icons/placeholder.png"),
//             //  (context, url) => SpinKitWave(
//             //   color: colorPrimary,
//             //   itemCount: 8,
//             // ),
//             // errorWidget: (context, error, stackTrace) {
//             //   return SpinKitWave(
//             //     color: colorPrimary,
//             //     itemCount: 8,
//             //   );
//             // },
//             // fit: BoxFit.fill,
//           );
//           OptimizedCacheImageProvider(banners!.image ?? ""),
//           fit: BoxFit.cover,
//         ),
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             left: 20.0,
//             bottom: 20.0,
//             child: Column(
//               children: [
//                 Container(
//                   width: 10.w,
//                   padding: EdgeInsets.all(8.0),
//                   // decoration: BoxDecoration(
//                   //   gradient: LinearGradient(
//                   //     colors: [
//                   //       Colors.grey.shade700,
//                   //       Colors.grey.shade400,
//                   //       Colors.grey.shade200,
//                   //     ],
//                   //     begin: Alignment.bottomCenter,
//                   //     end: Alignment.topCenter,
//                   //   ),
//                   // ),
//                   child: text(
//                     banners.name ?? "",
//                     fontweight: FontWeight.w700,
//                     isCentered: true,
//                     maxLine: 5,
//                     textColor: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     //
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: colorPrimary,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     width: 10.w,
//                     height: 40.0,
//                     child: Center(
//                       child: text(
//                         'Explore Now',
//                         decoration: TextDecoration.none,
//                         textColor: Colors.white,
//                         fontFamily: 'Poppins',
//                         fontSize: 10,
//                         fontweight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

class InnerView {
  final String? name;
  final ScrollController controller = ScrollController();
  InnerView({this.name});
}
