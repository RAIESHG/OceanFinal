import 'package:flutter/material.dart';


InputDecoration textfieldDecoration(
    {required Color borderAndIconColor,
    required Color labelColor,
    required String labelText,
    IconData? icon}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderAndIconColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderAndIconColor),
    ),
    focusedErrorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: borderAndIconColor)),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderAndIconColor),
    ),
    labelText: labelText,
    helperText: "",
    helperMaxLines: 1,
    labelStyle: TextStyle(color: labelColor),
    hintText: labelText,
    prefixIcon: Icon(
      icon,
      color: borderAndIconColor,
      size: 20,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: borderAndIconColor),
    ),
  );
}
