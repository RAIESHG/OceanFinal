import 'package:flutter/material.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Divide extends StatelessWidget {
  const Divide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      indent: 0.0,
      endIndent: 0.0,
    );
  }
}

class DetailsIconAndText extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final bool? isPhone;
  const DetailsIconAndText({Key? key, this.title, this.icon, this.isPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,

      padding: EdgeInsets.symmetric(vertical: 3.0),
      child: InkWell(
        onTap: isPhone ?? false
            ? () {
                launch("tel://$title}");
              }
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: colorPrimary,
                size: 20.sp,
              ),
              SizedBox(
                width: 5.w,
              )
            ],
            Container(
              child: text(
                "$title",
                maxLine: 2,
                fontweight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconsGrid extends StatelessWidget {
  final int? i;
  final BuildContext? context;
  final String? title;
  const IconsGrid({Key? key, this.i, this.context, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Stack(
        children: <Widget>[
          Container(
            // color: Colors.red,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/book${(i! % 5) + 1}.jpeg',
                fit: BoxFit.fitHeight,
                height: 20,
                width: 20,
              ),
            ),
          ),
          Container(
            //yo container ko kaam bhaneko contain garne ho
            // height: 120.0,
            // width: 120.0,
            decoration: BoxDecoration(
              // color: Colors.grey.shade200,

              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.65),
                  Color.fromRGBO(196, 196, 196, 0.1),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Positioned(
            bottom: 5.0,
            left: 3.0,
            right: 3.0,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                title ?? "Slug title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoCards extends StatelessWidget {
  final BuildContext? context;
  final int? i;
  const VideoCards({Key? key, this.context, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 20,
        // color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 20,
                color: Colors.grey.shade300,
                alignment: Alignment.topCenter,
                child: Center(
                    child: Image.asset('assets/images/play.png', height: 10)),
              ),
            ),
            Text(
              "Video title",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            // Text(
            //   "Author",
            //   style: TextStyle(
            //       fontSize: context.textTheme.subtitle2.fontSize - 2,
            //       fontWeight: FontWeight.w500),
            // )
          ],
        ),
      ),
    );
  }
}

class ImageCards extends StatelessWidget {
  final BuildContext? context;
  final int? i;
  const ImageCards({Key? key, this.context, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 20,
        width: 20,
        // color: Colors.blueGrey,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/book${i! + 1}.jpeg',
                  fit: BoxFit.cover,
                  height: 10,
                  width: 10,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,

                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.65),
                    Color.fromRGBO(196, 196, 196, 0.1),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 5.0,
              child: Column(
                children: [
                  Text(
                    "Bookname",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Author",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
