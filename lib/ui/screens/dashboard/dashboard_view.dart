import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/dashboard/dashboard_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        onModelReady: (DashboardViewModel model) {
          model.getDashboardData();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade300,
              appBar: appBarWithSearch(context),
              body: 
           
              SingleChildScrollView(
                child:    model.busy("object") == true ? 
                          Container(
                            child: SpinKitWave(
                              color: colorPrimary,
                              itemCount: 8,
                            ),
                          )
                        :Column(
                  children: [
                     Container(
                          height: 7.h,
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: text(
                              "Dashboard",
                              textColor: Colors.grey,
                              fontweight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 23.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  spreadRadius: 6,

                                  blurRadius: 8,
                                  offset: Offset(10, 12), // Shadow position
                                ),
                              ],
                              border: Border.all(color: Colors.blue),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${model.dashBoardData!.totalSaveCourse ?? ""}',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Text('Saved Course',
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                        Container(
                          height: 23.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  spreadRadius: 6,

                                  blurRadius: 8,
                                  offset: Offset(10, 12), // Shadow position
                                ),
                              ],
                              border: Border.all(color: Colors.blue),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                  '${model.dashBoardData!.totalPurchaseCourse ?? ""}',
                                  style: Theme.of(context).textTheme.headline2),
                              Text(
                                'Purchased Course',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.blue,
                      ),
                      height: 10.h,
                      width: 82.w,
                      child: Center(
                          child: Text('Notification',
                              style: Theme.of(context).textTheme.headline6)),
                    ),
                    Container(
                      height: 34.h,
                      width: 82.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          model.dashBoardData!.notifications == null
                              ? Container()
                              : Container(
                                height: 30.h,
                                child: ListView.builder(
                                    itemCount: model
                                        .dashBoardData!.notifications!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.notification_add_outlined),
                                              Column(
                                                children: [
                                                  Text(
                                                      '${model.dashBoardData!.notifications![index].title}'),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      '${model.dashBoardData!.notifications![index].date}'),
                                                ],
                                              ),
                                              Text('New',
                                                  style:
                                                      TextStyle(color: Colors.red)),
                                            ],
                                          ),
                                             Divider(
                            thickness: 2,
                          ),
                                        ],
                                      );
                                    },
                                  ),
                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => DashboardViewModel());
  }
}
