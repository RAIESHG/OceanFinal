import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/networkImageRequest/networkImage_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NetworkImageC extends StatelessWidget {
  final String imgLink;

  const NetworkImageC({Key? key, required this.imgLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CachedNetworkImageViewModel>.reactive(
        builder: (context, model, child) {
          return FadeInImage(
            image: NetworkImage(imgLink),
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
        },
        viewModelBuilder: () => CachedNetworkImageViewModel());
  }
}
