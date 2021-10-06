import 'package:flutter/material.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';

class AuthImageContainer extends StatelessWidget {
  final Widget child;
  const AuthImageContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage(authBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
