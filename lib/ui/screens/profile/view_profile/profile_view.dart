import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/ui/components/bottom_navigation/bottom_navigation_view.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/reusable_wiidgets.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/profile/view_profile/profile_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        onModelReady: (vm) async {
          await vm.getUserDetails();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: appBarWithSearch(context),
              bottomNavigationBar: BottomNavigationBarView(),
              backgroundColor: Colors.grey.shade300,
              // appBar: appBarWithSearch(context),
              body: model.isBusy
                  ? Center(child: SpinKitWave(
                          color: colorPrimary,
                          itemCount: 8,
                        ),)
                  : Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 100, 20, 30),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 0.25,
                                  height: 61.h,
                                  // height: MediaQuery.of(context).size.height,
                                  color: whiteColor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                      ),
                                      text(
                                        "${model.item!.firstName}",
                                        textColor: colorPrimary,
                                        fontSize: 20,
                                        fontweight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          model.navigatetoeditProfile();
                                        },
                                        child: Text("Edit Profile"),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      detailsDisplayWidget(
                                          context,
                                          text(
                                            "Contact Information",
                                            textColor: whiteColor,
                                            fontSize: 20,
                                            fontweight: FontWeight.w600,
                                          ),
                                          color: colorPrimary,
                                          height: 7.h,
                                          width: 70.w),
                                      detailsDisplayWidget(
                                          context,
                                          DetailsIconAndText(
                                            title:
                                                model.item!.firstName ?? "N/a",
                                            icon: Icons.person,
                                          ),
                                          height: 7.h,
                                          width: 70.w),
                                      detailsDisplayWidget(
                                          context,
                                          DetailsIconAndText(
                                            title: model.item!.email ?? "N/a",
                                            icon: Icons.email,
                                          ),
                                          height: 7.h,
                                          width: 70.w),
                                      detailsDisplayWidget(
                                          context,
                                          DetailsIconAndText(
                                            title: model.item!.phone ?? "N/a",
                                            icon: Icons.phone,
                                          ),
                                          height: 7.h,
                                          width: 70.w),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 20,
                          left: 20,
                          child: Center(
                            child: Container(
                                height: 25.h,
                                width: 35.w,
                                child: FadeInImage(
                                  image: NetworkImage(model.item!.image!),
                                  placeholder: AssetImage(
                                      "assets/icons/placeholder.png"),
                                )),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
        viewModelBuilder: () => ProfileViewModel());
  }
}
