// import 'package:flutter/material.dart';
// import 'package:ocean_publication/locator/locator.dart';
// import 'package:ocean_publication/model/order/cart/cartResponse.dart';
// import 'package:ocean_publication/model/order/product/categoryResponse/categoryResponse.dart';
// import 'package:ocean_publication/model/order/product/productResponse/productResponse.dart';
// import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';

// class CartProvider extends ChangeNotifier {

//   //Cart Starts from here ----------------------------------------------->

//   SharedPreferencesService sharedPreferencesService =
//       locator<SharedPreferencesService>();

//   List<CartResponse> cartObjects = [];
//   List<String> savedCart = [];
//   int counts = 0;
//   bool canAdd = true;

//   void saveCartLocal() {
//     sharedPreferencesService.saveCart(cartObjectList: cartObjects);
//   }

//   void readLocalCart() {
//     cartObjects = sharedPreferencesService.getSavedCart();
//     counts = cartObjects.length;
//   }

//   void addtoCart(ProductResponse product) {
//     for (int i = 0; i < cartObjects.length; i++) {
//       if (cartObjects[i].product.productId == product.productId) {
//         canAdd = false;
//       }
//     }
//     if (canAdd == false) {
//       notifyListeners();
//     } else {
//       cartObjects.add(
//         CartResponse(
//           (b) => b
//             ..product.itemName = product.itemName
//             ..product.discount = product.discount
//             ..product.productId = product.productId
//             ..product.availableQuantity = product.availableQuantity
//             ..product.images = product.images.toBuilder()
//             ..product.itemCompany = product.itemCompany
//             ..product.sellPrice = product.sellPrice
//             ..product.categoryId = product.categoryId
//             ..product.productUnit = product.productUnit
//             ..product.barcode = product.barcode
//             ..product.productDescription = product.productDescription
//             ..quantity = 1,
//         ),
//       );
//       counts++;
//       notifyListeners();
//     }
//     saveCartLocal();
//     canAdd = true;
//   }

//   int getindex(ProductResponse productResponse) {
//     int index = -1;
//     for (int i = 0; i < cartObjects.length; i++) {
//       if (cartObjects[i].product.barcode == productResponse.barcode) {
//         index = cartObjects.indexOf(cartObjects[i]);
//         return index;
//       }
//     }
//     return index;
//   }

//   void increaseQuantity(ProductResponse productResponse) {
//     int index = getindex(productResponse);
//     int quantity = cartObjects[index].quantity;
//     cartObjects[index] = (CartResponse((b) => b
//       ..product.itemName = cartObjects[index].product.itemName
//       ..product.availableQuantity = cartObjects[index].product.availableQuantity
//       ..product.images = cartObjects[index].product.images.toBuilder()
//       ..product.discount = cartObjects[index].product.discount
//       ..product.productId = cartObjects[index].product.productId
//       ..product.itemCompany = cartObjects[index].product.itemCompany
//       ..product.sellPrice = cartObjects[index].product.sellPrice
//       ..product.categoryId = cartObjects[index].product.categoryId
//       ..product.productUnit = cartObjects[index].product.productUnit
//       ..product.barcode = cartObjects[index].product.barcode
//       ..product.productDescription =
//           cartObjects[index].product.productDescription
//       ..quantity = quantity + 1));
//     notifyListeners();
//   }

//   decreaseQuantity(ProductResponse productResponse) {
//     int index = getindex(productResponse);
//     int quantity = cartObjects[index].quantity;
//     cartObjects[index] = (CartResponse((b) => b
//       ..product.itemName = cartObjects[index].product.itemName
//       ..product.availableQuantity = cartObjects[index].product.availableQuantity
//       ..product.images = cartObjects[index].product.images.toBuilder()
//       ..product.discount = cartObjects[index].product.discount
//       ..product.productId = cartObjects[index].product.productId
//       ..product.itemCompany = cartObjects[index].product.itemCompany
//       ..product.sellPrice = cartObjects[index].product.sellPrice
//       ..product.categoryId = cartObjects[index].product.categoryId
//       ..product.productUnit = cartObjects[index].product.productUnit
//       ..product.barcode = cartObjects[index].product.barcode
//       ..product.productDescription =
//           cartObjects[index].product.productDescription
//       ..quantity = quantity == 1 ? 1 : quantity - 1));
//     notifyListeners();
//   }

//   removeFromCart(ProductResponse productResponse) {
//     int index = getindex(productResponse);
//     cartObjects.removeAt(index);
//     counts--;
//     notifyListeners();
//   }

//   clearCart() {
//     cartObjects = [];
//     counts = 0;
//     saveCartLocal();
//     notifyListeners();
//   }
// }
