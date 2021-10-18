import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/bottom_navigation/bottom_navigation_view.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/history/history_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:sizer/sizer.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<HistoryViewModel>.reactive(
        onModelReady: (HistoryViewModel model) {
          model.getHistory();
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: appBarWithSearch(context),
            backgroundColor: Colors.grey.shade300,
            bottomNavigationBar: BottomNavigationBarView(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Container(
                          height: 7.h,
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: text(
                              "History",
                              textColor: Colors.grey,
                              fontweight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          )),
                model.busy("object") == false
                    ? model.historyData != null
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: model.historyData!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                          Text(
                                              "Invoice No. : ${model.historyData![index]!.invoiceNo}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                         
                                          Text(
                                              "User Id : ${model.historyData![index]!.userId}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1), 
                                       
                                          Text(
                                              "Rs ${model.historyData![index]!.grandTotal} / Paid via ${model.historyData![index]!.paymentMethod},",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                                  SizedBox(height: 1.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    model.navigateToHistoryId(
                                                        model
                                                            .historyData![
                                                                index]!
                                                            .id!);
                                                  },
                                                  child: Container(
                                                    height: 4.h,
                                                    width: MediaQuery.of(context).size.width / 4.5,
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    color: Colors.orange,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .remove_red_eye_sharp,
                                                          color: whiteColor,
                                                        ),
                                                        SizedBox(width: 1.w,),
                                                        text(
                                                          "View",
                                                          textColor:
                                                              whiteColor,
                                                          isCentered: true,
                                                          // maxLine: 1,
                                                          fontSize: 12.sp,
                                                          fontweight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //  ClipRRect(
                                              //   borderRadius: BorderRadius.circular(5.0),
                                              //   child: InkWell(
                                              //     onTap: () {
                                              //     },
                                              //     child: Container(
                                              //       height: 35.0,
                                              //       // width: context.screenWidth / 4.5,
                                              //       padding: EdgeInsets.all(2.0),
                                              //       color: Colors.red,
                                              //       child: Row(
                                              //         children: [
                                              //           Icon(Icons.download,color: whiteColor,),
                                              //           Center(
                                              //             child: text(
                                              //               "Download",
                                              //               textColor: whiteColor,
                                              //               isCentered: true,
                                              //               // maxLine: 1,
                                              //               height: 1.0,
                                              //               fontweight: FontWeight.w500,
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Text("No Order History Available")
                    :  SpinKitWave(
                          color: colorPrimary,
                          itemCount: 8,
                        ),
              ],
            ),
          );
        },
        viewModelBuilder: () => HistoryViewModel());
  }
}
