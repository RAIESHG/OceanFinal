import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/services/database_services.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:ocean_publication/ui/screens/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckOutViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  SharedPreferencesService sharedPreferencesService =
      locator<SharedPreferencesService>();
  int quantity = 0;

  num totalquantities = 0;
  num totalPrice = 0;
  SnackbarService snackbarService = locator<SnackbarService>();

  List<CartItem> cartItems = [];
  CartService cartService = CartService();
  Future<void> getCartItems() async {
    //
    List<CartItem> results = await cartService.getFromDB();
    cartItems = results;
    refreshSummary();
    notifyListeners();
  }

  Future<void> removeItemFromCart(int? id, {int? index}) async {
    print("removed");
    //TODO: f
    cartItems.removeAt(index!);
    await cartService.deleteFromDB(id!);
    refreshSummary();
    notifyListeners();
  }

  void addQuantity(int index) {
    cartItems[index].quantity++;
    refreshSummary();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    cartItems[index].quantity--;
    refreshSummary();
    notifyListeners();
  }

  Future<void> addToCart(dynamic item) async {
    print("addded item details");
    print(item.title);
    var cartItem = CartItem(
      id: item.id,
      image: item.image,
      name: item.title,
      author: item is PackageData ? "" : item.author,
      price: item.price,
      type: item is BookData
          ? "Book"
          : item is VideoData
              ? "Video"
              : "Package",
      quantity: 1,
    );
    await cartService.addToDB(cartItem);
    print("added");
    notifyListeners();
  }

  refreshSummary() {
    totalquantities = 0;
    totalPrice = 0;
    cartItems.forEach((element) {
      totalquantities += element.quantity!;
      totalPrice += (element.price * element.quantity)!;
    });

    notifyListeners();
  }

  completeBuy() async {
    List<CartItem> results = await cartService.getFromDB();
    List<Map> cartList = [];
    print(cartItems.length);
    for (int i = 0; i < results.length; i++) {
      cartList
          .add({"id": results[i].id, "name": results[i].type!.toLowerCase()});
    }
    setBusyForObject("buyobject", true);
    // await getUser();
    //
    var body = {"cart": cartList, "payment_method": "esewa"};
    print(body);
    var response = await postListRequest("/orderStore", cartList: cartList);

    setBusyForObject("buyobject", false);

    navigationService.back();
    navigationService.back();

    if (response.statusCode == 200) {
      List<CartItem> results = await cartService.getFromDB();
      cartItems = results;

      snackbarService.showSnackbar(
          message: "Purchase Order Recieved", title: "Sucess");
      for (int i = 0; i < cartItems.length; i++) {
      await cartService.deleteFromDB(cartItems[i].id!);
      }
    } else {
      snackbarService.showSnackbar(
          message: "Please Try Again Later", title: "Something Went Wrong");
    }
    notifyListeners();
  }

  navigatetoeditProfile() {
    Future.delayed(Duration(seconds: 1));
    navigationService.navigateTo(Routes.editProfileView);
  }

  // int quantity = 1;
  navigatetocheckout() {
    Future.delayed(Duration(seconds: 1));
    navigationService.navigateTo(Routes.checkoutView);
  }
}
