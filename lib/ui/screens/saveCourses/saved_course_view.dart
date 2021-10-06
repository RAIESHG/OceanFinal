import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/saveCourses/saved_course_view_model.dart';
import 'package:stacked/stacked.dart';

class SavedCourseView extends StatelessWidget {
  const SavedCourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedCourseViewModel>.reactive(
        onModelReady: (SavedCourseViewModel model) {
          model.getSavedCourses();
        },
        builder: (context, model, child) {
          var screenheight = MediaQuery.of(context).size.height;
          var screenwidth = MediaQuery.of(context).size.width;
          return SafeArea(
            child: Scaffold(
              appBar: appBarWithSearch(context),
              body: model.busy("object") == true
                  ? SpinKitWave(
                      color: colorPrimary,
                      itemCount: 8,
                    )
                  : Container(
                      height: screenheight * 1,
                      width: screenwidth * 1,
                      child: ListView(
                          // shrinkWrap: true,
                          children: [
                            model.savedCourseData!.books!.length == 0
                                ? Container()
                                : SlidingCoursesContainer(
                                    object: model.savedCourseData!.books,
                                    title: "Books",
                                  ),
                            // model.savedCourseData!.videos!.length == 0 ? Container() :

                            // SlidingCoursesContainer(
                            //   object: model.savedCourseData!.videos,
                            //   title: "Videos",
                            // ),
                            model.savedCourseData!.packages!.length == 0
                                ? Container()
                                : SlidingCoursesContainer(
                                    object: model.savedCourseData!.packages,
                                    title: "Packages",
                                  ),
                          ]),
                    ),
            ),
          );
        },
        viewModelBuilder: () => SavedCourseViewModel());
  }
}

class SlidingCoursesContainer extends ViewModelWidget<SavedCourseViewModel> {
  final title;
  final object;
  const SlidingCoursesContainer({Key? key, this.title, this.object})
      : super(key: key);

  @override
  Widget build(BuildContext context, SavedCourseViewModel model) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenheight * 0.5,
        child: Card(
          elevation: 10.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                          "$title",
                          fontweight: FontWeight.w600,
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
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        object.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BookCard(
                                      context: context, object: object[index]),
                                 
                                 
                                  Center(
                                    child: 
                                    
                                    model.busy("${object[index].id}") == true ? CircularProgressIndicator() :
                                    OutlinedButton(
                                      onPressed: () {
                                        model.deleteSavedCourse(object[index]);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
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
    );
  }
}
