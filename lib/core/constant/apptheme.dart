import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

ThemeData themeapp = ThemeData(
  fontFamily: 'Tajawal',
  textTheme: TextTheme(
    titleMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: Appcolor.black),
    bodyMedium: TextStyle(
        fontSize: 14,
        color: Appcolor.grey.withOpacity(0.5),
        fontWeight: FontWeight.w200),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: Appcolor.black),
    titleSmall: TextStyle(fontSize: 14, color: Appcolor.black),
  ),
);
