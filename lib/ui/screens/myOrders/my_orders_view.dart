import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/screens/myOrders/my_orders_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyOrdersViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              child: Center(child: Text("My orders")),
            ),
          );
        },
        viewModelBuilder: () => MyOrdersViewModel());
  }
}
