import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/services/database_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  SnackbarService snackbarService = locator<SnackbarService>();
  NavigationService navigationService = locator<NavigationService>();
  List<CartItem> cartItems = [];
  CartService cartService = CartService();
  Future<void> getCartItems() async {
    //
    List<CartItem> results = await cartService.getFromDB();
    cartItems = results;
    notifyListeners();
  }

  Future<void> removeItemFromCart(int? id, {int? index}) async {
    print("removed");
    cartItems.removeAt(index!);
    await cartService.deleteFromDB(id!);
    notifyListeners();
  }

  void addQuantity(int index) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    cartItems[index].quantity--;
    notifyListeners();
  }

  Future<void> addToCart(dynamic item) async {
    print("addded item details");
    print(item.title);
    var cartItem = CartItem(
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

  completeBuy() async {
    List<CartItem> results = await cartService.getFromDB();
    List<Map> cartList = [];
    print(cartItems.length);
    for (int i = 0; i < results.length; i++) {
      cartList.add({"id": results[i].id, "name": results[i].type!.toLowerCase()});
    }
    setBusyForObject("object", true);
    // await getUser();
    //
    var body = {"cart": cartList, "payment_method": "esewa"};
    print(body);
    var response = await postListRequest("/orderStore", cartList: cartList);

    setBusyForObject("object", false);

    navigationService.back();
    navigationService.back();

    if (response.statusCode == 200) {
      snackbarService.showSnackbar(
          message: "Purchase Order Recieved", title: "Sucess");
    } else {
      snackbarService.showSnackbar(
          message: "Please Try Again Later", title: "Something Went Wrong");
    }
    notifyListeners();
  }
}



CartItem cartItemFromMap(String str) => CartItem.fromMap(json.decode(str));

String cartItemToMap(CartItem data) => json.encode(data.toMap());

class CartItem {
  CartItem({
    this.id,
    this.name,
    this.type,
    this.author,
    this.price,
    this.image,
    this.quantity,
  });
  final String? type;
  final int? id;
  final String? name;
  final String? author;
  final dynamic price;
  final String? image;
  dynamic quantity;

  CartItem copyWith({
    int? id,
    String? type,
    String? name,
    String? author,
    dynamic price,
    String? image,
    dynamic quantity,
  }) =>
      CartItem(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        author: author ?? this.author,
        price: price ?? this.price,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
      );

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        author: json["author"] == null ? null : json["author"],
        price: json["price"] == null ? null : json["price"],
        image: json["image"] == null ? null : json["image"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "name": name == null ? null : name,
        "author": author == null ? null : author,
        "price": price == null ? null : price,
        "image": image == null ? null : image,
        "quantity": quantity == null ? null : quantity,
      };
}
