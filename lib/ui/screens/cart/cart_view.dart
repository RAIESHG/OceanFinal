import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/bottom_navigation/bottom_navigation_view.dart';
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
               bottomNavigationBar: BottomNavigationBarView(),
              backgroundColor: Colors.grey.shade300,
              // bottomNavigationBar: model.cartItems.length == 0
              //     ? Container(height: 9.h)
              //     : InkWell(
              //         onTap: () {
              //           // model.cartItems.forEach((element) {
              //           //   model.increaseTotal(element);
              //           // });
              //           showDialog(
              //             context: context,
              //             builder: (context) => CartSummaryWidget(
              //               quantity: model.totalquantities,
              //               totalPrice: model.totalPrice,
              //             ),
              //           );
              //         },
              //         child: Container(
              //           color: colorPrimary,
              //           width: double.infinity,
              //           height: 7.h,
              //           child: Center(
              //             child: text(
              //               "Checkout".toUpperCase(),
              //               textColor: Colors.white,
              //               fontweight: FontWeight.bold,
              //               fontSize: 20,
              //             ),
              //           ),
              //         ),
              //       ),
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
                          Container(
                              height: 8.h,
                              width: double.infinity,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    text(
                                      "${model.cartItems.length} Items",
                                      textColor: Colors.grey,
                                      fontSize: 13.sp,
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                    ),
                                    Icon(
                                      Icons.menu,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) => Container(
                              // color: Colors.green,
                              child: FittedBox(
                                child: StackedElevatedImage(
                                  detailsWidget: Padding(
                                    padding: EdgeInsets.only(
                                        left: 5, top: 10, right: 10),
                                    child: Stack(
                                      children: [
                                        LayoutBuilder(
                                          builder: (context, constrains) {
                                            return Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 40.w,
                                                    // color: Colors.red,

                                                    child: text(
                                                      model.cartItems[index]
                                                              .name ??
                                                          "",
                                                      isCentered: false,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      textColor: Colors.black,
                                                      fontSize: 10.sp,
                                                      maxLine: 2,
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.1.h),
                                                  Container(
                                                    width: 40.w,
                                                    child: text(
                                                      model.cartItems[index]
                                                                  .author ==
                                                              ""
                                                          ? "Package"
                                                          : "By ${model.cartItems[index].author}",
                                                      isCentered: false,
                                                      fontweight:
                                                          FontWeight.w600,
                                                      textColor: Colors.grey,
                                                      fontSize: 9.sp,
                                                      maxLine: 2,
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.3.h),
                                                  text(
                                                    "NRS.${model.cartItems[index].price * model.cartItems[index].quantity}",
                                                    isCentered: false,
                                                    textColor: Colors.black,
                                                    // decoration: TextDecoration.lineThrough,
                                                    fontweight: FontWeight.w400,
                                                    fontSize: 10.sp,
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
                                                  SizedBox(height: 0.3.h),

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
                                                              0.35,
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
                                                        InkWell(
                                                          onTap: () => model
                                                              .removeItemFromCart(
                                                            model
                                                                .cartItems[
                                                                    index]
                                                                .id,
                                                            index: index,
                                                          ),
                                                          child: text('Remove',
                                                              textColor:
                                                                  Colors.grey),
                                                        ),
                                                        SizedBox(
                                                          width: 1.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.08.h),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          right: 1.0,
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

                                  height: 9.h,
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
                            height: 2.h,
                          ),

                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 90.w,
                                  padding:
                                      EdgeInsets.fromLTRB(7.0, 12.0, 7.0, 7.0),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      text(
                                        "Your Cart Summary".toUpperCase(),
                                        fontweight: FontWeight.w700,
                                        fontSize: 13.sp,
                                      ),
                                      SizedBox(
                                        height: 3.h,
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
                                              detail:
                                                  "${model.totalquantities}",
                                            ),
                                            Divide(),
                                            summaryDetails(
                                              title: "Subtotal",
                                              detail: "${model.totalPrice}",
                                            ),
                                            Divide(),
                                            summaryDetails(
                                                title: "Discount", detail: "0"),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
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
                                              title: "Total Amount",
                                              detail: "${model.totalPrice}",
                                              color: blackColor,
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Container(
                                              width: 80.w,
                                              height: 6.h,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    model
                                                        .navigatetocheckOutView();
                                                  },
                                                  child: Text(
                                                    'Check Out'.toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 13.sp),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                              borderRadius: BorderRadius.circular(5)),
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
