import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/components/cards.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';

class BookSlider extends StatelessWidget {
  final BuildContext context;
  final dynamic object;
  final Color? bgColor;

  const BookSlider({Key? key, required this.context, this.object, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isElevated = true;
    bool showViewmore = true;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Card(
        // ignore: dead_code
        elevation: isElevated ? 10.0 : 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                      "${object.heading ?? ""}",
                      fontweight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    if (showViewmore)
                      viewmoreAction(
                        context,
                        onTapped: () {
                          NavigationService navigationService =
                              locator<NavigationService>();
                          navigationService.navigateTo(Routes.viewAllView,
                              arguments: ViewAllViewArguments(
                                  type: object.data.first ?? ""));
                        },
                      ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    object.data.length,
                    (index) => BookCard(
                      context: context,
                      object: object.data[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
