import 'package:flutter/material.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/model/letsExplore/lets_explore.dart';
import 'package:ocean_publication/ui/components/drawer/drawerViewModel.dart';

import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/authentication/auth_presenter.dart';
import 'package:ocean_publication/ui/screens/authentication/login/login_view.dart';
import 'package:ocean_publication/ui/screens/lets_explore/lets_explore_view.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
        onModelReady: (DrawerViewModel model) {
          model.onModelReady();
        },
        builder: (context, model, child) {
          print(model.checkLogin);
          return Container(
            width: 50.w,
            child: Drawer(
              // color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // UserAccountsDrawerHeader(
                  //     accountName: Text("Ocean Publication"),
                  //     accountEmail: Text("www.oceanpublication.com.np")),
                  Container(
                    //
                    height: 27.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(authBackgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 18.h, child: Assetimage(path: logo)),
                        SizedBox(
                          height: 2.h,
                        ),
                        text(
                          "Publication Pvt. Ltd.",
                          textColor: Colors.white,
                          fontweight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 6.h,
                    color: Colors.blue,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 4.h,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            text(
                              "Home",
                              fontSize: 13.sp,
                              fontweight: FontWeight.w600,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  model.checkLogin == false
                      ? Column(
                        children: [
                          Container(
                              height: 7.h,
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.book,
                                      color: Colors.blue.withOpacity(0.8),
                                      size: 4.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    text(
                                      "Book",
                                      fontSize: 14.sp,
                                      fontweight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  LetsExploreView(type: "book"),
                                    ),
                                  );
                                },
                              ),
                            ),
                             Container(
                              height: 7.h,
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.video_camera_front,
                                      color: Colors.blue.withOpacity(0.8),
                                      size: 4.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    text(
                                      "Video",
                                      fontSize: 14.sp,
                                      fontweight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>     LetsExploreView(type: "video"),
                                    ),
                                  );
                                },
                              ),
                            ),
                             Container(
                              height: 7.h,
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cases,
                                      color: Colors.blue.withOpacity(0.8),
                                      size: 4.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    text(
                                      "Package",
                                      fontSize: 14.sp,
                                      fontweight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  LetsExploreView(type: "package"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          Container(
                              height: 7.h,
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.login,
                                      color: Colors.blue.withOpacity(0.8),
                                      size: 4.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    text(
                                      "Login/SignUp",
                                      fontSize: 14.sp,
                                      fontweight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AuthPresenter(),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.categories.length,
                          // separatorBuilder: (ctx, i) => Divider(),
                          itemBuilder: (ctx, i) {
                            return Container(
                              height: 8.h,
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(
                                      model.icons[i],
                                      color: Colors.blue.withOpacity(0.8),
                                      size: 4.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    text(
                                      model.categories[i],
                                      fontSize: 13.sp,
                                      fontweight: FontWeight.w600,
                                      textColor: blackColor,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  if (model.categories[i] == "Logout") {
                                    model.onLogout();
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => model.navigate[i],
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                  // ListView.builder(
                  //   itemCount: model.categories.length,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   // separatorBuilder: (ctx, i) => Divider(),
                  //   itemBuilder: (ctx, i) {
                  //     return Container(
                  //       height: 20,
                  //       padding: EdgeInsets.only(left: 20),
                  //       child: InkWell(
                  //         child: Row(
                  //          children: [
                  //             icon(
                  //               model.icons[i],
                  //               height: 80.0,
                  //             ),
                  //             SizedBox(
                  //               width: 20,
                  //             ),
                  //             text(
                  //               model.categories[i],
                  //               fontSize: 20,
                  //               fontweight: FontWeight.w600,
                  //             ),
                  //           ],
                  //         ),
                  //         onTap: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => model.navigate[i],
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => DrawerViewModel());
  }
}
