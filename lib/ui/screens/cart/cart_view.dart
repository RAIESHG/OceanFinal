// import 'package:esewa_pnp/esewa.dart';
// import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/reusable_wiidgets.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';
import 'cart_viewmodel.dart';

import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        onModelReady: (CartViewModel model) {
          model.getCartItems();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade300,
              bottomNavigationBar: model.cartItems.length == 0
                  ? Container(height: 9.h)
                  : InkWell(
                      onTap: () {
                        num totalquantities = 0;
                        num totalPrice = 0;
                        model.cartItems.forEach((element) {
                          totalquantities += element.quantity!;
                          totalPrice += (element.price * element.quantity)!;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => CartSummaryWidget(
                            quantity: totalquantities,
                            totalPrice: totalPrice,
                          ),
                        );
                      },
                      child: Container(
                        color: colorPrimary,
                        width: double.infinity,
                        height: 7.h,
                        child: Center(
                          child: text(
                            "Checkout".toUpperCase(),
                            textColor: Colors.white,
                            fontweight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
              appBar: AppBar(
                title: text(
                  "My Cart",
                  textColor: whiteColor,
                  fontweight: FontWeight.bold,
                  fontSize: 20,
                ),
                automaticallyImplyLeading: false,
                backgroundColor: colorPrimary,
                centerTitle: true,
              ),
              // appBar: appBarWithSearch(context, title: "Cart"),
              body: model.cartItems.length == 0
                  ? Center(
                      child: text(
                        "No items added in the cart",
                        fontweight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemBuilder: (context, index) => Container(
                              // color: Colors.green,
                              child: FittedBox(
                                child: StackedElevatedImage(
                                  detailsWidget: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Stack(
                                      children: [
                                        LayoutBuilder(
                                          builder: (context, constrains) {
                                            return Align(
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  text(
                                                    model.cartItems[index]
                                                            .name ??
                                                        "",
                                                    isCentered: false,
                                                    fontweight: FontWeight.w500,
                                                    fontSize: 10.sp,
                                                    maxLine: 2,
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  text(
                                                    model.cartItems[index]
                                                                .author ==
                                                            ""
                                                        ? "Package"
                                                        : "${model.cartItems[index].author}",
                                                    isCentered: false,
                                                    fontweight: FontWeight.w600,
                                                    fontSize: 9.sp,
                                                    maxLine: 2,
                                                  ),
                                                  SizedBox(height: 0.7.h),
                                                  text(
                                                    "${model.cartItems[index].price * model.cartItems[index].quantity}",
                                                    isCentered: false,
                                                    // decoration: TextDecoration.lineThrough,
                                                    fontweight: FontWeight.w400,
                                                    fontSize: 15,
                                                  ),
                                                  // Container(
                                                  //   color: Colors.red,
                                                  //   child: text(
                                                  //     "fhajkf", //      "${widget.item.offerPrice}".toCurrency,
                                                  //     textColor: Colors.green,
                                                  //     isCentered: true,
                                                  //     fontweight: FontWeight.w500,
                                                  //     fontSize: 20,
                                                  //   ),
                                                  // ),

                                                  Container(
                                                    // height:  constrains.maxHeight,
                                                    // width: constrains.maxWidth,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: constrains
                                                                  .maxWidth *
                                                              0.45,
                                                          height: constrains
                                                                  .maxHeight *
                                                              0.15,
                                                          child: Row(
                                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  model.decreaseQuantity(
                                                                      index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 6.w,
                                                                  height: 4.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                            colorPrimary),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color:
                                                                        colorPrimary,
                                                                    size: 12.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              //
                                                              // _incr_decr_Button(
                                                              //   constrains,
                                                              //   icon: Icons
                                                              //       .remove,
                                                              //   action: () {
                                                              //     model
                                                              //         .cartItems[
                                                              //             index]
                                                              //         .quantity--;
                                                              //   },
                                                              // ),
                                                              Container(
                                                                height: 20.0,
                                                                width: constrains
                                                                        .maxWidth *
                                                                    0.15,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              colorPrimary),
                                                                ),
                                                                child: Center(
                                                                  child: text(
                                                                    "${model.cartItems[index].quantity}",
                                                                    isCentered:
                                                                        true,
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  model.addQuantity(
                                                                      index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 6.w,
                                                                  height: 4.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                            colorPrimary),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color:
                                                                        colorPrimary,
                                                                    size: 12.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              // _incr_decr_Button(
                                                              //   constrains,
                                                              //   icon: Icons.add,
                                                              //   action: () {
                                                              //     model
                                                              //         .cartItems[
                                                              //             index]
                                                              //         .quantity++;
                                                              //   },
                                                              // ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            CustomOutlineButton(
                                                              onTapped: () => model
                                                                  .removeItemFromCart(
                                                                model
                                                                    .cartItems[
                                                                        index]
                                                                    .id,
                                                                index: index,
                                                              ),
                                                              title: 'Remove',
                                                            ),
                                                            SizedBox(
                                                              width: 1.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          right: 2.0,
                                          top: 2.0,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconWidget(
                                                path: model.cartItems[index]
                                                            .type ==
                                                        "Video"
                                                    ? videoIcon
                                                    : model.cartItems[index]
                                                                .type ==
                                                            "Package"
                                                        ? packageIcon
                                                        : bookIcon,
                                                width: 1.w,
                                                height: 2.h,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              text(
                                                  model.cartItems[index].type ??
                                                      ""),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // detailsWidget: checkoutItemDetail(
                                  //   model.cartItems[index],
                                  //   onTappedRemoveButton: () =>
                                  //       model.removeItemFromCart(
                                  //     model.cartItems[index].id,
                                  //     index: index,
                                  //   ),

                                  height: 10.h,
                                  image: model.cartItems[index].image ?? '',
                                ),
                              ),
                            ),
                            itemCount: model.cartItems.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),

                          // 15.heightBox,
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: packageContainer(context, "Shop more"),
                          // ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
        viewModelBuilder: () => CartViewModel());
  }
}

// Widget checkoutItemDetail(CartItem item,
//     {required Function onTappedRemoveButton}) {
//   return Padding(
//     padding: EdgeInsets.all(3.0),
//     child: Stack(
//       children: [
//         LayoutBuilder(
//           builder: (context, constrains) {
//             return Align(
//               alignment: Alignment.centerLeft,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   text(
//                     item.name ?? "",
//                     isCentered: false,
//                     fontweight: FontWeight.w500,
//                     fontSize: 10,
//                   ),
//                   SizedBox(height: 10),
//                   text(
//                     item.author == "" ? "Package" : "${item.author}",
//                     isCentered: false,
//                     fontweight: FontWeight.w600,
//                     fontSize: 10,
//                   ),
//                   SizedBox(height: 10),
//                   text(
//                     "${item.price * item.quantity}",
//                     isCentered: false,
//                     // decoration: TextDecoration.lineThrough,
//                     fontweight: FontWeight.w400,
//                     fontSize: 10,
//                   ),
//                   // Container(
//                   //   child: text(
//                   //     "fhajkf", //      "${widget.item.offerPrice}".toCurrency,
//                   //     textColor: Colors.green,
//                   //     isCentered: true,
//                   //     fontweight: FontWeight.w500,
//                   //     fontSize: 20,
//                   //   ),
//                   // ),

//                   Container(
//                     // width: constrains.maxWidth,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: constrains.maxWidth * 0.45,
//                           height: constrains.maxHeight * 0.15,
//                           child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               //
//                               _incr_decr_Button(
//                                 constrains,
//                                 icon: Icons.remove,
//                                 action: () {
//                                   item.quantity--;
//                                 },
//                               ),
//                               Container(
//                                 height: 20.0,
//                                 width: constrains.maxWidth * 0.15,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: colorPrimary),
//                                 ),
//                                 child: Center(
//                                   child: text(
//                                     "${item.quantity}",
//                                     isCentered: true,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                               ),
//                               _incr_decr_Button(
//                                 constrains,
//                                 icon: Icons.add,
//                                 action: () {
//                                   item.quantity++;
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             CustomOutlineButton(
//                               onTapped: onTappedRemoveButton,
//                               title: 'Remove',
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//         Positioned(
//           right: 2.0,
//           top: 2.0,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               icon(
//                 item.type == "Video"
//                     ? videoIcon
//                     : item.type == "Package"
//                         ? packageIcon
//                         : bookIcon,
//                 width: 1.w,
//                 height: 2.h,
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               text(item.type ?? ""),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _incr_decr_Button(BoxConstraints constrains,
//     {required IconData icon, required Function action}) {
//   return InkWell(
//     onTap: () {
//       action();
//     },
//     child: Container(
//       width: 20.0,
//       height: 20.0,
//       decoration: BoxDecoration(
//         border: Border.all(color: colorPrimary),
//       ),
//       child: Icon(
//         icon,
//         color: colorPrimary,
//         size: 12.0,
//       ),
//     ),
//   );
// }

class CartSummaryWidget extends StatelessWidget {
  final dynamic totalPrice;
  final num? quantity;
  const CartSummaryWidget({this.totalPrice, this.quantity});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        builder: (context, model, child) {
          return model.busy("object") == true
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90.w,
                          padding: EdgeInsets.fromLTRB(7.0, 12.0, 7.0, 7.0),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              text(
                                "Your Cart Summary",
                                fontweight: FontWeight.w700,
                                fontSize: 25,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    // summaryDetails(
                                    //   title: "Bookname",
                                    //   detail: item.title,
                                    // ),
                                    // divider(),
                                    summaryDetails(
                                      title: "Total Quantity",
                                      detail: "$quantity",
                                    ),
                                    Divide(),
                                    summaryDetails(
                                      title: "Subtotal",
                                      detail: "$totalPrice",
                                    ),
                                    Divide(),
                                    summaryDetails(
                                        title: "Discount", detail: "0"),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: Row(
                                        children: List.generate(
                                          50,
                                          (index) => Expanded(
                                            child: Container(
                                              color: index % 2 == 0
                                                  ? Colors.transparent
                                                  : Colors.grey,
                                              height: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    summaryDetails(
                                      title: "Grand Total",
                                      detail: "$totalPrice",
                                      color: blackColor,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Divide(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                // color: Colors.red,
                                // height: context.screenHeight * 0.15,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    text(
                                      "Proceed your Payment with".toUpperCase(),
                                      fontweight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // ignore: deprecated_member_use
                                        OutlineButton(
                                          child: IconWidget(
                                            path: esewaIcon,
                                            width: 10.w,
                                            height: 5.h,
                                          ),
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                          onPressed: () async {
                                            // ESewaConfiguration _configuration = ESewaConfiguration(
                                            //     clientID:
                                            //         "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
                                            //     secretKey:
                                            //         "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
                                            //     environment: ESewaConfiguration
                                            //         .ENVIRONMENT_TEST //ENVIRONMENT_LIVE
                                            //     );
                                            // ESewaPnp _eSewaPnp =
                                            //     ESewaPnp(configuration: _configuration);
                                            // ESewaPayment _payment = ESewaPayment(
                                            //   amount: 564,
                                            //   productName: "Ocean Publication",
                                            //   productID: "Ocn pub",
                                            //   callBackURL: "",
                                            // );
                                            // try {
                                            //   final _res = await _eSewaPnp.initPayment(
                                            //     payment: _payment,
                                            //   );

                                            //   print(_res.message);
                                            //   print(_res.status);
                                            //   // Handle success
                                            // } on ESewaPaymentException catch (e) {
                                            //   // Handle error
                                            //   print(e.toString());
                                            // }
                                          },
                                        ),
                                        // ignore: deprecated_member_use
                                        OutlineButton(
                                          onPressed: () {
                                            model.completeBuy();
                                          },
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                          child: text("Buy"),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
        viewModelBuilder: () => CartViewModel());
  }
}

// class CartSummaryWidget extends StatelessWidget {
//   final dynamic totalPrice;
//   final num? quantity;
//   const CartSummaryWidget({this.totalPrice, this.quantity});
//   @override
//   Widget build(BuildContext context) {
//     return
//   }

Widget summaryDetails({String? title, String? detail, Color? color}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Row(
        children: [
          Container(
            width: constraints.maxWidth * 0.45,
            child: text(
              "$title",
              maxLine: 1,
              fontweight: FontWeight.w500,
              textColor: color ?? Colors.grey.shade600,
            ),
          ),
          Container(
            width: constraints.maxWidth * 0.5,
            child: text(
              "$detail",
              fontSize: 10,
              maxLine: 1,
              textColor: color ?? Colors.grey.shade600,
            ),
          ),
        ],
      );
    },
  );
}
