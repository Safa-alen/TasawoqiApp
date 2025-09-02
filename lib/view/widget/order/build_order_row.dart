import 'dart:ui' show TextStyle;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ui show TextDirection;
import 'package:intl/intl.dart';

Widget buildOrderRow(String number, DateTime date) {
  final dateString = DateFormat("d MMM yyyy, hh:mm a").format(date);
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: ui.TextDirection.rtl,
      children: [
        Text("رقم الطلب $number",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
        Text(dateString,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16)),
      ],
    ),
  );
}
