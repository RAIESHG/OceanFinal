import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/bottom_navigation/bottom_navigation_view.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/screens/history/history_by_id/history_by_id_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class HistoryByIdView extends StatelessWidget {
  final id;
  const HistoryByIdView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryByIdViewModel>.reactive(
        onModelReady: (HistoryByIdViewModel model) {
          model.getHistory(id);
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "History Data",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )),
                model.busy("object") == false
                    ? model.historyData != null
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: model.historyData!.orderItems!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item =
                                    model.historyData!.orderItems![index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20.h,
                                            child: Image.network(
                                              "${item.image}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Title: ${item.title}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Invoice No. : ${model.historyData!.invoiceNo}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "User Id : ${model.historyData!.userId}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Rs ${model.historyData!.grandTotal} / Paid via ${model.historyData!.paymentMethod}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Digital or Hard Copy : ${item.digitalOrHardcopy}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          item.type == "book"
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Author:  ${item.author}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                      "IsBn No: ${item.isbnNo}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                      "Edition: ${item.edition}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                      "Language: ${item.language}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                      "Copy Type: ${item.digitalOrHardcopy}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                      "Quantity: ${item.quantity}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        model.navigateToPdfView(
                                                            item.book!);
                                                      },
                                                      child: Text(
                                                        "Read",
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                          item.type == "video"
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Author ${item.author}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                      "Length. ${item.time}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text("Play"),
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Text("No Order History Available")
                    : SpinKitWave(
                        color: colorPrimary,
                        itemCount: 8,
                      ),
              ],
            ),
          );
        },
        viewModelBuilder: () => HistoryByIdViewModel());
  }
}
