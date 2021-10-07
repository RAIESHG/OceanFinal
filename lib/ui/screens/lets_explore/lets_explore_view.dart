import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/screens/lets_explore/lets_explore_viewmodel.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:stacked/stacked.dart';

class LetsExploreView extends StatelessWidget {
  final String type;

  const LetsExploreView({Key? key, this.type = "book"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LetsExploreViewmodel>.reactive(
        onModelReady: (vm) async {
          await vm.getAllItems(type);
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: appBarWithSearch(context, title: "Ocean Publication"),
              body:
                  // 10.heightBox,
                  model.busy("object") == true
                      ? SpinKitChasingDots(color: colorPrimary)
                      : Padding(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      model.user != null
                                          ? "Hey ${model.user!.firstName ?? ""}"
                                          : "",
                                      textColor: greyColor,
                                      fontSize: 20,
                                      fontweight: FontWeight.w700,
                                    ),
                                    // 5.heightBox,
                                    text(
                                      "Let's Explore",
                                      textColor: colorPrimary,
                                      fontSize: 20,
                                      fontweight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),

                              Flexible(
                                child: ListView.builder(
                                  itemCount:
                                      model.letsExploreData!.items!.length,
                                  // shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(bottom: 12.0),
                                    child: Card(
                                      elevation: 10.0,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 5.0),
                                          color: whiteColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0, right: 15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    text(
                                                      "${model.letsExploreData!.items![index].heading ?? ""}",
                                                      fontweight:
                                                          FontWeight.w600,
                                                      // fontSize: 1,
                                                    ),
                                                    // if (showViewmore)
                                                    //   viewmoreAction(
                                                    //     context,
                                                    //     onTapped: () {
                                                    //       push(context,
                                                    //           LetsExploreView(type: object.data.first ?? ""));
                                                    //     },
                                                    //   ),
                                                  ],
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: List.generate(
                                                    model.letsExploreData!
                                                        .items![0].data.length,
                                                    (index) => BookCard(
                                                     context: context,
                                                      object:model
                                                          .letsExploreData!
                                                          .items![0]
                                                          .data[index],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // packageContainer(context, "Trending $type",
                              //     isElevated: false, showViewmore: false),
                              // packageContainer(context, "Exciting $type",
                              // isElevated: false, showViewmore: false),
                            ],
                          ),
                        ),
            ),
          );
        },
        viewModelBuilder: () => LetsExploreViewmodel());
  }
}
