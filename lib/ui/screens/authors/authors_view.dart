import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/authors/authors.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/authors/authors_viewmodel.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sizer/sizer.dart';

class AuthorsView extends StatelessWidget {
  const AuthorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthorsViewmodel>.reactive(
        onModelReady: (vm) async {
          await vm.getAuthors();
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: appBarWithSearch(context, title: 'Authors'),
            body: Column(
              children: [
                Container(
                    height: 8.h,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: text(
                        "${model.authors!.data!.length} Authors",
                        textColor: Colors.grey,
                        fontSize: 13.sp,
                      ),
                    )),
                AnimationLimiter(
                    child: model.authors == null
                        ? Center(
                            child: SpinKitWave(
                              color: colorPrimary,
                              itemCount: 8,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.authors!.data!.length,
                            itemBuilder: (context, index) =>
                                AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 700),
                                  child: SlideAnimation(
                                    horizontalOffset: 10,
                                    child: FadeInAnimation(
                                      child: StackedElevatedImage(
                                        image:
                                            model.authors!.data![index].image ??
                                                "",
                                        detailsWidget: Padding(
                                          padding: EdgeInsets.only(
                                              // top: MediaQuery.of(context).size.width * 0.07,
                                              // bottom: MediaQuery.of(context).size.width * 0.02,
                                              ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                // width: context.screenWidth * 0.4,
                                                child: text(
                                                  "${model.authors!.data![index].name}",
                                                  isCentered: true,
                                                  fontweight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  textColor: Colors.black,

                                                  // fontSize: context.textTheme.headline6!.fontSize,
                                                ),
                                              ),

                                              ElevatedButton(
                                                  onPressed: () {
                                                    print("go to view profile");
                                                    NavigationService
                                                        navigationService =
                                                        locator<
                                                            NavigationService>();
                                                    navigationService.navigateTo(
                                                        Routes
                                                            .authorProfileView,
                                                        arguments:
                                                            AuthorProfileViewArguments(
                                                                authorData: model
                                                                        .authors!
                                                                        .data![
                                                                    index]));
                                                  },
                                                  child: Text("View Profile"))
                                              // 10.heightBox,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                    //

                    ),
              ],
            ),
          );
        },
        viewModelBuilder: () => AuthorsViewmodel());
  }
}
