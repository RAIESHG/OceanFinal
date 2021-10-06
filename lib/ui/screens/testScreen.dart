import "package:flutter/material.dart";

import 'package:http/http.dart' as http;

import 'package:stacked/stacked.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TestScreenViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
                body: Center(
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        model.changeTop();
                      },
                      child: Text(
                        "Top Color",
                        style: TextStyle(color: model.topColor),
                      ),),
                  InkWell(
                    onTap: () {
                      model.changeBottom();
                    },
                    child: Text(
                      "Buttom Color",
                      style: TextStyle(color: model.bottom),
                    ),
                  ),
                ],
              ),
            )),
          );
        },
        viewModelBuilder: () => TestScreenViewModel());
  }
}

class TestScreenViewModel extends BaseViewModel {
  Color topColor = Colors.red;
  void changeTop() {
    if (topColor == Colors.red) {
      topColor = Colors.green;
      notifyListeners();
    } else {
      topColor = Colors.red;
      notifyListeners();
    }
  }

  Color bottom = Colors.green;
  void changeBottom() {
    if (bottom == Colors.green) {
      bottom = Colors.black;
    } else {
      bottom = Colors.green;
    }
  }
}

