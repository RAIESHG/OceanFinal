import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/view_all/view_all_viewmodel.dart';
import 'categories_drawer.dart';
import 'package:stacked/stacked.dart';

class ViewAllView extends StatelessWidget {
  final Object? type;

  const ViewAllView({Key? key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewAllViewmodel>.reactive(
      onModelReady: (ViewAllViewmodel model) {
        model.getAllData(type!, context);
      },
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          drawer: model.busy("object") == true
              ? SpinKitWave(
                  itemCount: 8,
                  color: colorPrimary,
                )
              : 
              type is PackageData ? Container():
              CategoriesDrawer(
                  results: model.results!,
                ),
          backgroundColor: Colors.grey.shade300,
          appBar: appBarWithSearch(context, title: 'Books'),
          body: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                color: whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                      model.datatype,
                      fontweight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    InkWell(
                      onTap: () {
                        model.scaffoldKey.currentState!.openDrawer();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_alt,
                            color: colorPrimary,
                          ),
                          text(
                            "Filter",
                            fontweight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              model.items.length > 0
                  ? Flexible(
                      child: AnimationLimiter(
                        child: ListView.builder(
                            itemCount: model.items.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: Duration(milliseconds: 700),
                                child: SlideAnimation(
                                  horizontalOffset: 20,
                                  child: FadeInAnimation(
                                    child: StackedElevatedImage(
                                      detailsWidget:
                                          BookDetailsWidgetForElevatedDisplay(
                                        item: model.items[index],
                                      ),
                                      image: model.items[index].image,
                                    ),
                                  ),
                                ),
                              );
                            },),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SpinKitWave(
                        color: colorPrimary,
                      ),
                    ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ViewAllViewmodel(),
    );
  }
}