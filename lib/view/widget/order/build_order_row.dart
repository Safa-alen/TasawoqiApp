import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ui show TextDirection;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/data/datasource/static/categoy.dart' as order;

Widget buildOrderRow(String number, DateTime date) {
  final dateString = DateFormat("d MMM yyyy, hh:mm a").format(date);
  final Color color;
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: ui.TextDirection.rtl,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.ordersHome2, arguments: {
              "number": number,
              "date": date,
              "products": order.products, // ✅ المنتجات الخاصة بهالطلب
            });
          },
          child: Text(
            "رقم الطلب $number",
            style: TextStyle(
              fontSize: 16,
              color: Appcolor.black, // خليها مميزة
            ),
          ),
        ),
        Text(
          dateString,
          style: TextStyle(
            color: Appcolor.grey3,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
