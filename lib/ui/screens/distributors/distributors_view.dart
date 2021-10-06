import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';

import 'package:ocean_publication/ui/components/reusable_wiidgets.dart';
import 'package:ocean_publication/ui/screens/distributors/distributer_viewmodel.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';

import 'package:stacked/stacked.dart';

class DistributorView extends StatelessWidget {
  const DistributorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DistributerViewmodel>.reactive(
        onModelReady: (vm) {
          //
          vm.getDistributorData();
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: appBarWithSearch(context),
            body: model.isBusy
                ? SpinKitWave(
                    itemCount: 8,
                    color: colorPrimary,
                  )
                : AnimationLimiter(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: model.distributorData!.length,
                      //
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            horizontalOffset: 20,
                            child: FadeInAnimation(
                              child: StackedElevatedImage(
                                detailsWidget: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    // color: Colors.red,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      //
                                      children: [
                                        //
                                        text(
                                          "${model.distributorData![index].name}",
                                          isCentered: false,
                                          fontweight: FontWeight.w600,
                                          fontSize: 25.sp,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),

                                        DetailsIconAndText(
                                          title:
                                              "${model.distributorData![index].contactPerson}",
                                          icon: Icons.person,
                                          
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        DetailsIconAndText(
                                          title:
                                              "${model.distributorData![index].address}",
                                          icon: Icons.location_on,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        DetailsIconAndText(
                                          title:
                                              "${model.distributorData![index].phoneNumber}",
                                          icon: Icons.phone,
                                          isPhone: true,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                image: model.distributorData![index].image!,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          );
        },
        viewModelBuilder: () => DistributerViewmodel());
  }
}

// Widget distributorDetailsWidget(
//     BuildContext context, DistributorData distributorData) {
//   return FittedBox(
//     fit: BoxFit.contain,
//     child: Container(
//       // color: Colors.red,
//       padding: EdgeInsets.symmetric(vertical: 3.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         //
//         children: [
//           //
//           text(
//             "${distributorData.name}",
//             isCentered: false,
//             fontweight: FontWeight.w600,
//             fontSize: 25.sp,
//           ),
//           SizedBox(
//             height: 1.h,
//           ),

//           DetailsIconAndText(
//             context,
//             title: "${distributorData.contactPerson}",
//             icon: Icons.location_city,
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           DetailsIconAndText(
//             context,
//             title: "${distributorData.address}",
//             icon: Icons.location_city,
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           DetailsIconAndText(
//             context,
//             title: "${distributorData.phoneNumber}",
//             icon: Icons.phone,
//             isPhone: true,
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//         ],
//       ),
//     ),
//   );
// }
