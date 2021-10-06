import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';

class Choice {
  //
  final int? id;
  final String? title;
  final String? icon;
  final Color? textColor;
  final Color? iconColor;

  Choice({this.id, this.title, this.icon, this.textColor, this.iconColor});
}
