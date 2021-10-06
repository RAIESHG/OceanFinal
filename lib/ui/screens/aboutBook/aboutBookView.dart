import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/model/allCourses/allCoursesReponse.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/networkImageRequest/networkImage_view.dart';
import 'package:ocean_publication/ui/screens/aboutBook/aboutBookViewModel.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class AboutBookView extends StatelessWidget {
  final dynamic object;
  const AboutBookView({Key? key, required this.object}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutBookViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.withOpacity(0.9),
              appBar: appBarWithSearch(context),
              body: model.isBusy
                  ? Center(
                      child: SpinKitWave(
                        color: colorPrimary,
                        itemCount: 8,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 90, 20, 30),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: whiteColor,
                                    ),
                                    width: MediaQuery.of(context).size.width /
                                        0.25,
                                    height: 125.h,
                                    // height: MediaQuery.of(context).size.height,

                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 10, 8, 0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 100,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Nepali Natak'),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text('5 reviews'),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                object.type == "book"
                                                    ? ElevatedButton(
                                                        onPressed: () {
                                                          model.navigateToPdf(
                                                              object.book);
                                                        },
                                                        child: Text('Read'),
                                                      )
                                                    : Text(""),
                                                object.type == "video"
                                                    ? ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text('Play'),
                                                      )
                                                    : Text(""),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.blue,
                                            height: 5.h,
                                            width: 75.w,
                                            child: Center(child: Text('About')),
                                          ),
                                          Container(
                                            color: Colors.blue.withOpacity(0.2),
                                            height: 30.h,
                                            width: 75.w,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Html(
                                                data: "${object.description}",
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          // Container(
                                          //   color: Colors.blue,
                                          //   height: 5.h,
                                          //   width: 75.w,
                                          //   child: Center(
                                          //       child:
                                          //           Text('How do we use it')),
                                          // ),
                                          // Container(
                                          //   color: Colors.blue.withOpacity(0.2),
                                          //   height: 30.h,
                                          //   width: 75.w,
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.all(5),
                                          //     child: Text(
                                          //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                          //       textAlign: TextAlign.justify,
                                          //     ),
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Container(
                                            color: Colors.blue,
                                            height: 5.h,
                                            width: 75.w,
                                            child:
                                                Center(child: Text('FeedBack')),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                24, 0, 24, 0),
                                            child: TextFormField(
                                              controller:
                                                  model.feedbackController,
                                              maxLines: 4,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter your feedback',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                model.sendFeedBack(object);
                                              },
                                              child: Text('Submit')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 35,
                            child: Center(
                              child: Container(
                                height: 20.h,
                                width: 35.w,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Container(
                                      height: 20.h,
                                      width: 30.h,
                                      child: NetworkImageC(
                                        imgLink: object.image,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
        viewModelBuilder: () => AboutBookViewModel());
  }
}
