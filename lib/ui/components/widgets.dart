import 'package:flutter/material.dart';
import 'package:ocean_publication/helpers/colors.dart';

Widget text(
  String text, {
  double? fontSize,
  double latterSpacing = 0.2,
  bool isJustify = false,
  double height = 1.2,
  FontWeight? fontweight,
  TextDecoration? decoration,
  String? fontFamily,
  Color? textColor,
  bool? isCentered,
  int? maxLine,
}) {
  // if (text != null) {
  //   text = removeAllHtmlTags(text);
  // }
  return Text(
    "$text",
    textAlign: isJustify
        ? TextAlign.center
        : isJustify
            ? TextAlign.justify
            : TextAlign.left,
    maxLines: isJustify ? 20 : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      decoration: decoration != null ? decoration : null,
      fontSize: fontSize,
      height: height,
      fontWeight: fontweight ?? FontWeight.normal,
      color: textColor != null ? textColor : colorPrimary,
      letterSpacing: latterSpacing,
    ),
  );
}

BorderRadius borderRadius({double radius = 5.0}) =>
    BorderRadius.circular(radius);
InputBorder outlineInputBorder({Color? color, double radius = 0.0}) =>
    OutlineInputBorder(
      borderRadius: borderRadius(radius: radius),
      borderSide: BorderSide(
        color: color ?? Colors.grey.shade400,
      ),
    );
Widget textField({
  String? title,
  String? hintText = "",
  int? maxLength,
  Color? cursorColor,
  TextEditingController? controller,
  bool showBorder = true,
  int maxLines = 1,
  bool obscureText = false,
  Widget? prefixIcon,
  double borderRadius = 10.0,
  Color? fillColor,
  Function? onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (title != null) ...[
        text("$title", fontSize: 16.0),
        SizedBox(
          height: 10,
        )
      ],
      Material(
        color: Colors.transparent,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: cursorColor ?? colorPrimary,
          maxLength: maxLength,
          maxLines: maxLines,
          // autofillHints: [
          //   AutofillHints.email,
          // ],
          style: TextStyle(color: colorPrimary, fontSize: 12.0),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 12.0),
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
            hintText: "$hintText",
            enabledBorder:
                showBorder ? outlineInputBorder(radius: borderRadius) : null,
            border:
                showBorder ? outlineInputBorder(radius: borderRadius) : null,
            focusedBorder:
                showBorder ? outlineInputBorder(radius: borderRadius) : null,
          ),
          onChanged: (value) => onChanged!(value),
        ),
      ),
    ],
  );
}

Container detailsDisplayWidget(BuildContext context, Widget detail,
    {Color? color, double? height, double? width}) {
  return Container(
    decoration: BoxDecoration(
      color: color ?? Colors.grey.shade300,
      border: Border(
        bottom: BorderSide(
          color: colorPrimary,
        ),
        right: BorderSide(
          color: colorPrimary,
        ),
        left: BorderSide(
          color: colorPrimary,
        ),
      ),
    ),
    width: width ?? 20,
    height: height ?? 20,
    child: Center(
      child: detail,
    ),
  );
}

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback onTapped;
  final String title;

  CustomOutlineButton({required this.onTapped, required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: colorPrimary),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: text(title),
      ),
    );
  }
}
