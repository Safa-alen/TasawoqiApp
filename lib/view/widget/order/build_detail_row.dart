// ////////////////////////////الخيارات بالكرت الرقم التاريخ.....//////////////////////////////

import 'package:flutter/material.dart'
    show
        Widget,
        MainAxisAlignment,
        Color,
        EdgeInsets,
        TextStyle,
        Text,
        Row,
        Padding;
import 'package:tasawoqi/core/constant/color.dart';

Widget buildDetailRow(
  String title,
  String value, {
  Color? valueColor,
  Color? titleColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(
            //  fontWeight: FontWeight.bold,
            fontSize: 16,
            color: valueColor ?? Appcolor.grey,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: titleColor ?? Appcolor.black,
          ),
        ),
      ],
    ),
  );
}
