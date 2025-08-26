import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/data/model/recomm_stores_modle.dart';
import 'package:tasawoqi/view/widget/cart/product_card.dart'
    show CartProductCard;
import 'package:tasawoqi/view/widget/cart/summary_row.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:flutter/widgets.dart' as ui;

import '../../../core/constant/color.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final orderNumber = args["orderNumber"];
    final orderDate = args["orderDate"] as DateTime;
    final products = args["products"] as List<dynamic>;
    final subtotal = args["subtotal"] as double;
    final shipping = args["shipping"] as double;
    final discount = args["discount"] as double;
    final totalPrice = args["totalPrice"] as double;

    return Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Scaffold(
            appBar: AppBar(
                title: Align(
              alignment: AlignmentGeometry.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TitleOnly(
                    title: " رقم الطلب${orderNumber}",
                  ),
                  const SizedBox(height: 4),
                  Text(DateFormat("d MMM yyyy, hh:mm a").format(orderDate),
                      style: TextStyle(
                        color: Appcolor.grey,
                        fontSize: 16,
                      ))
                ],
              ),
            )),
            body: ListView(padding: const EdgeInsets.all(16), children: [
              const SizedBox(height: 16),
              // عرض المنتجات
              ...products.map((p) => CartProductCard(product: p)).toList(),

              const SizedBox(height: 20),
              // ملخص الفاتورة
              SummaryRow(title: "قيمة المشتريات", value: subtotal),
              SummaryRow(title: "رسوم التوصيل", value: shipping),
              SummaryRow(title: "الخصومات", value: discount),
              const Divider(),
              SummaryRow(title: "المبلغ الكلي", value: totalPrice, bold: true),
              const SizedBox(height: 20),
              // الجدولة
            ])));
  }
}
