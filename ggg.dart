// // flutter pub run build_runner watch --delete-conflicting-outputs

// // library filename;

// // import 'package:built_value/built_value.dart';
// // import 'package:built_value/serializer.dart';
// // import 'package:json_annotation/json_annotation.dart';
// // import 'package:ocean_publication/serializers.dart';
// //
// // part 'filename.g.dart';

// // @JsonSerializable()
// // abstract class BIG
// //     implements Built<BIG, BIGBuilder> {
// //    String get status;
// //     String get message;
// //     List<Object> get objects;
// //   //String get id;
// //   BIG._();
// //   factory BIG([void Function(BIGBuilder) updates]) =
// //       _$BIG;

// //   static Serializer<BIG> get serializer => _$smallSerializer;

// //   factory BIG.fromJson(Map<String, dynamic> json) {
// //     //json = {...json, "id": json['id'].toString()};
// //     BIG? filename =
// //         serializers.deserializeWith(BIG.serializer, json);
// //     return filename!;
// //   }

// //   Map<String, dynamic> toJson() {
// //     final filenameJson =
// //         serializers.serializeWith(BIG.serializer, this);
// //     return filenameJson as Map<String, dynamic>;
// //   }
// // }

// import 'package:built_collection/built_collection.dart';
// import 'package:ocean_publication/model/order/orderHistory/orderHistoryResponse.dart';
// import 'package:ocean_publication/model/order/cart/cartResponse.dart';

// void main() {
//   var data = OrderHistoryResponse((b) => b
//     ..orderProducts = [
//       CartResponse(
//         (b) => b
//           ..product.itemName = "Item Name"
//           ..product.discount = 200
//           ..product.productId = 1
//           ..product.availableQuantity = 10
//           ..product.images = ListBuilder<String>()
//           ..product.itemCompany = ""
//           ..product.sellPrice = 200
//           ..product.productGroup = "Product Group"
//           ..product.productUnit = "kg"
//           ..product.barcode = "12354"
//           ..product.productDescription = "Description"
//           ..quantity = 1,
//       ),
//     ]
//     ..date = "2020/02/02"
//     ..paymentMethod = "Cash on Delivery"
//     ..shippingAddress.district = ""
//     ..shippingAddress.id = "1"
//     ..shippingAddress.district = "sindupalchowk"
//     ..shippingAddress.latitude = 0
//     ..shippingAddress.longitude = 0
//     ..shippingAddress.name = "Raiesh"
//     ..shippingAddress.phoneNumber = "9860120715"
//     ..shippingAddress.streetAddress = "Dhaulagiri"
//     ..shippingAddress.village = "Village"
//     ..shippingAddress.zone = "zone");

//   print(data);
// }
