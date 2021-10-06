import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../helpers/colors.dart';

class IconWidget extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final Color? color;

  const IconWidget({Key? key, this.path, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path!,
      width: width ?? 20,
      height: height ?? 20,
      color: color,
    );
  }
}



class Assetimage extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  const Assetimage(
      {Key? key, this.path, this.width, this.height, this.color, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path!,
      width: width ?? 150,
      height: height ?? 70,
      color: color,
      fit: fit,
    );
  }
}



class Networkimage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  const Networkimage({Key? key, this.url, this.width, this.height, this.color, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return FadeInImage(
            image: NetworkImage(url!),
            // memCacheHeight: 200,
            // imageUrl: "$imgLink",
            placeholder: AssetImage("assets/icons/placeholder.png"),
            //  (context, url) => SpinKitWave(
            //   color: colorPrimary,
            //   itemCount: 8,
            // ),
            // errorWidget: (context, error, stackTrace) {
            //   return SpinKitWave(
            //     color: colorPrimary,
            //     itemCount: 8,
            //   );
            // },
            // fit: BoxFit.fill,
          );
  }
}



final String iconPath = "assets/icons";
final String bookIcon = "$iconPath/book.png";
final String errorImage = "$iconPath/error.jpeg";
final String categoriesIcon = "$iconPath/categories.png";
final String downloadIcon = "$iconPath/download.png";
final String favouriteIcon = "$iconPath/favorite.png";
final String homeIcon = "$iconPath/home.png";
final String libraryIcon = "$iconPath/library.png";
final String logo = "$iconPath/logo.png";
final String logoutIcon = "$iconPath/logout.png";
final String packageIcon = "$iconPath/package.png";
final String profileIcon = "$iconPath/profile.png";
final String settingIcon = "$iconPath/setting.png";
final String userIcon = "$iconPath/user.png";
final String videoIcon = "$iconPath/video.png";
final String esewaIcon = "$iconPath/esewa.png";
final String authBackgroundImage = "assets/images/bg_image.png";
