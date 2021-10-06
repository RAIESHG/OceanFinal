import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';

import 'package:ocean_publication/model/authors/authors.dart';
import 'package:ocean_publication/ui/screens/authors/authorsprofileViewModel.dart';
import 'package:ocean_publication/ui/screens/details/details_view.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthorProfileView extends StatelessWidget {
  final AuthorData authorData;

  const AuthorProfileView({Key? key, required this.authorData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthorsProfileViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade300,
              appBar: appBarWithSearch(
                context,
                title: "Utsav Ghimire",
              ),
              body: Container(
                padding: EdgeInsets.only(top: 30),
                child: SingleChildScrollView(
                  child: Column(
                    //
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Stack(
                            children: [
                              //
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  color: Colors.white,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: Container(
                                        child: text(
                                          authorData.name ?? "",
                                          fontweight: FontWeight.w800,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: FadeInImage(
                                            image: NetworkImage(
                                              authorData.image ??
                                                  "https://oceanpublication…824182098529084627_n.png",
                                            ),
                                            // memCacheHeight: 200,
                                            // imageUrl: "$imgLink",
                                            placeholder: AssetImage(
                                                "assets/icons/placeholder.png"),
                                            //  (context, url) => SpinKitWave(
                                            //   color: colorPrimary,
                                            //   itemCount: 8,
                                            // ),
                                            // errorWidget: (context, error, stackTrace) {
                                            //   return SpinKitWave(
                                            //     color: colorPrimary,
                                            //     itemCount: 8,
                                            //   );
                                            // },
                                            // fit: BoxFit.fill,
                                          )

                                          // child: imageUrl != null
                                          //     ? Image.network(imageUrl)
                                          //     : Image.asset(profileIcon),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: whiteColor,
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.only(bottom: 45.0),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: colorPrimary,
                              child: Center(
                                child: text(
                                  "Subjects",
                                  // fontSize: context.textTheme.headline6!.fontSize,
                                  textColor: whiteColor,
                                ),
                              ),
                            ),
                            ...List.generate(
                              // authorData.books!.length,3
                              1,
                              (index) => InkWell(
                                onTap: () {
                                  // authorData.books![index],
                                  NavigationService navigationService =
                                      locator<NavigationService>();
                                  navigationService.navigateTo(
                                      Routes.authPresenter,
                                      arguments: DetailsObjViewArguments(
                                          object: null));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: index.isEven
                                      ? Colors.grey.shade300
                                      : greyColor,
                                  child: Center(
                                    child: text(
                                      authorData.subjects ?? "",
                                      fontSize: 20,
                                      textColor: blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => AuthorsProfileViewModel());
  }
}
