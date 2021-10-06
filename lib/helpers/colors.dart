import 'package:flutter/material.dart';

LinearGradient dashboardGradient({Alignment? begin, Alignment? end}) =>
    LinearGradient(
      begin: begin ?? Alignment.topRight,
      end: end ?? Alignment.bottomLeft,
      colors: [
        Color(0xFF0373FD),
        Color(0xFF0987FD),
        Color(0xFF09A0FD),
        Color(0xff16CAFC),
      ],
    );
Color appBarBgColor = Color(0xFF0373FD);
Color drawerBg = Color(0xffE6FDFD);
Color bottomNavBg = Color(0xffA5CFF3).withOpacity(0.4);
Color colorPrimary = Color(0xff4174C3);
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color greyColor = Colors.grey.shade400;
Color containerColor = Color(0xffDEDBDB);
