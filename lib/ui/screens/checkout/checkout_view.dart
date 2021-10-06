// import 'package:esewa_pnp/esewa.dart';
// import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/ui/components/book_slider.dart';
import 'package:ocean_publication/ui/components/reusable_wiidgets.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/elevated_stacked_image.dart';
import 'package:ocean_publication/ui/components/widgets.dart';

class CheckoutView extends StatefulWidget {
  final dynamic item;
  CheckoutView({Key? key, this.item}) : super(key: key);
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CheckoutView> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: appBarWithSearch(context, title: "Cart"),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 10.heightBox,
                Container(
                  // height: context.screenHeight * 0.25,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15.0,
                        right: 20.0,
                        left: 20.0,
                        child: Container(
                          // height: context.screenHeight * 0.2 - 5,
                          // width: context.screenWidth * 0.85,
                          decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: borderRadius(radius: 10.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                // left: context.screenWidth * 0.15,
                                // top: context.screenWidth * 0.05,
                                ),
                            alignment: Alignment.topCenter,
                            child: text(
                              "Checkout",
                              textColor: whiteColor,
                              fontSize: 20,
                              fontweight: FontWeight.w700,
                              isCentered: null,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 18.0,
                        right: 20.0,
                        left: 15.0,
                        child: Container(
                          // height: context.screenHeight * 0.24 - 10,
                          // width: context.screenWidth * 0.85 - 10,
                          child: FittedBox(
                            child: StackedElevatedImage(
                              detailsWidget: checkoutItemDetail(),
                              image: widget.item.image,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 10.heightBox,
                CartSummaryWidget(item: widget.item, quantity: quantity),
                // 15.heightBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: BookSlider(context: context, object: "Shop more"),
                ),
                // 10.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkoutItemDetail() {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(widget.item.title,
                    isCentered: false,
                    fontweight: FontWeight.w500,
                    fontSize: 20),
                // 5.heightBox,
                text(
                  widget.item is PackageData ? "" : "By ${widget.item.author}",
                  isCentered: false,
                  fontweight: FontWeight.w600,
                  fontSize: 20,
                ),
                // 5.heightBox,
                text(
                  "${widget.item.price}",
                  isCentered: false,
                  decoration: TextDecoration.lineThrough,
                  fontweight: FontWeight.w400,
                  // fontSize: context.textTheme.subtitle2!.fontSize,
                ),
                Container(
                  child: text(
                    "${widget.item.offerPrice}",
                    textColor: Colors.green,
                    isCentered: true,
                    fontweight: FontWeight.w500,
                    // fontSize: context.textTheme.subtitle2!.fontSize,
                  ),
                ),
                // 5.heightBox,
                Container(
                  width: constrains.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: constrains.maxWidth * 0.45,
                        height: constrains.maxHeight * 0.2,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //
                            _incr_decr_Button(
                              constrains,
                              icon: Icons.remove,
                              action: () {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              },
                            ),
                            Container(
                              height: 20.0,
                              width: constrains.maxWidth * 0.15,
                              decoration: BoxDecoration(
                                border: Border.all(color: colorPrimary),
                              ),
                              child: Center(
                                child: text(
                                  "$quantity",
                                  isCentered: true,
                                  // fontSize:
                                  //     context.textTheme.subtitle2!.fontSize,
                                ),
                              ),
                            ),
                            _incr_decr_Button(
                              constrains,
                              icon: Icons.add,
                              action: () {
                                quantity++;
                              },
                            ),
                          ],
                        ),
                      ),
                      // CustomOutlineButton()
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _incr_decr_Button(BoxConstraints constrains,
      {IconData? icon, required Function action}) {
    return InkWell(
      onTap: () {
        setState(() {
          action();
        });
      },
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          border: Border.all(color: colorPrimary),
        ),
        child: Icon(
          icon,
          color: colorPrimary,
          size: 12.0,
        ),
      ),
    );
  }
}

class CartSummaryWidget extends StatelessWidget {
  final dynamic item;
  final int? quantity;
  const CartSummaryWidget({this.item, this.quantity});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // width: context.screenWidth * 0.95,
            padding: EdgeInsets.fromLTRB(7.0, 12.0, 7.0, 7.0),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                text(
                  "Your Order Summary",
                  fontweight: FontWeight.w700,
                  // fontSize: context.textTheme.subtitle1!.fontSize! + 3,
                ),
                // 15.heightBox,
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      summaryDetails(
                        title: "Bookname",
                        detail: item.title,
                      ),
                      Divide(),
                      summaryDetails(title: "Quantity", detail: "$quantity"),
                      Divide(),
                      summaryDetails(
                        title: "Subtotal",
                        detail: "${item.offerPrice * quantity}",
                      ),
                      Divide(),
                      summaryDetails(title: "Discount", detail: "0"),
                      dottedLine(),
                      summaryDetails(
                        title: "Grand Total",
                        detail: "${item.offerPrice * quantity}",
                        color: blackColor,
                      ),
                      // 8.heightBox,
                      Divide(),
                    ],
                  ),
                ),
                // 8.heightBox,
                Container(
                  // color: Colors.red,
                  // height: context.screenHeight * 0.15,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      text(
                        "Proceed your Payment with".toUpperCase(),
                        fontweight: FontWeight.w700,
                        // fontSize: context.textTheme.subtitle2!.fontSize! + 3,
                      ),
                      // 15.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // ignore: deprecated_member_use
                          OutlineButton(
                            child: IconWidget(
                            path:  esewaIcon,
                              // width: context.screenWidth * 0.25,
                              // height: context.screenWidth * 0.1,
                            ),
                            borderSide: BorderSide(color: colorPrimary),
                            onPressed: () async {
                              //
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
                          OutlineButton(
                            onPressed: () {
                              //
                            },
                            borderSide: BorderSide(color: colorPrimary),
                            child: text("Cash on Delivery"),
                          )
                        ],
                      ),
                      // 5.heightBox,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                // fontSize: context.textTheme.subtitle2!.fontSize,
                maxLine: 1,
                textColor: color ?? Colors.grey.shade600,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget dottedLine() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: List.generate(
          50,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.grey,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
