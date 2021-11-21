import 'dart:convert';

import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:ocean_publication/ui/screens/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BaseViewModel {
  int initialIndex = 0;
  int length = 3;
  //  void initState() {
  //   super.initState();
  //   object = widget.object;
  // }

  SnackbarService snackbarService = locator<SnackbarService>();
  int activeIndex = 0;

  changeValue(int newVal) {
    activeIndex = newVal;
    notifyListeners();
  }



  NavigationService navigationService = locator<NavigationService>();

  final String loremText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed risus eget tellus tincidunt malesuada ut at risus. Duis vehicula arcu ac facilisis consectetur. Curabitur congue, justo id tristique iaculis, metus sem cursus nisi, aliquet rutrum nunc ex at risus. Sed tristique, ex nec ultrices dignissim, orci enim pulvinar nisi, ac varius purus ante non sapien. Aenean ac elementum risus. Sed arcu ipsum, malesuada non venenatis vel, malesuada vitae odio. Mauris egestas augue enim, ut hendrerit ipsum sagittis eget. Proin volutpat eget erat at molestie. Ut suscipit, eros eget vehicula tristique, nisi lorem mollis justo, ut blandit eros risus at quam.Donec arcu ipsum, pharetra et convallis vitae, volutpat ac est. Integer aliquet est lectus. Nulla id nibh quis tellus malesuada posuere. Morbi porttitor at neque eu accumsan. Vestibulum accumsan fringilla quam at convallis. Vivamus sed metus quis est aliquam volutpat. Sed ut sem lacinia, lacinia enim vulputate, tempus arcu. Sed cursus ipsum eu purus commodo elementum. Ut elit mi, auctor quis sagittis feugiat, efficitur in ipsum. Proin tellus orci, porttitor at laoreet ut, dictum ut lorem.Sed et sollicitudin ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas porttitor ac metus id iaculis. Donec at odio molestie, maximus risus in, efficitur nisi. Integer eget magna eleifend, varius turpis vel, tempor felis. Morbi at nisl auctor, sodales velit et, ultrices nibh. Aliquam ut lorem ultrices, sollicitudin leo in, egestas tortor. Phasellus ut orci non nibh pretium congue ut vitae augue. Ut convallis, ante id vehicula rhoncus, libero nibh dapibus diam, a dignissim libero purus eget diam. Aliquam quis neque eget turpis fermentum rhoncus. Vestibulum lacinia metus erat, ut maximus enim dapibus vel. Vestibulum feugiat, magna id venenatis accumsan, velit quam ullamcorper dui, eu maximus risus mi a magna. Donec elit eros, laoreet eu nisl et, bibendum viverra lectus.";
  final List<String> tabBarTitles = [
    "Description",
    "Details",
    "Reviews",
  ];
  var object;
  bool isReadingMore = false;

  navigateToCheckout(var object) {
    navigationService.navigateTo(Routes.checkoutView,
        arguments: CheckoutViewArguments(item: object));
  }

  Future<void> addToCart(var object) async {
    await CartViewModel().addToCart(object);

    // navigationService.navigateTo(
    //   Routes.cartView,
    // );
  }

  void saveCourse({required String courseId, required String bookName}) async {
    setBusyForObject("save", true);
    // await getUser();
    //
    var response = await postRequest("/save-course",
        body: {"courseId": courseId, "name": "book"});

    if (json.decode(response.body)["status"] == "true") {
      snackbarService.showSnackbar(message: "Saved Course");
    } else {
      snackbarService.showSnackbar(message: "Please Try Again Later");
    }

    setBusyForObject("save", false);

    notifyListeners();
  }
}
