import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/view/widget/cart/summary_row.dart';
import 'package:tasawoqi/view/widget/order/build_order2.dart';
import 'package:flutter/widgets.dart' as ui;

class Order2Home extends StatelessWidget {
  Order2Home({super.key});

  @override
  Widget build(BuildContext context) {
    // استلام البيانات من Get.arguments
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final String number = args["number"] ?? "—";
    final DateTime? date = args["date"] is DateTime ? args["date"] : null;
    final String dateString =
        date != null ? DateFormat("d MMM yyyy, hh:mm a").format(date) : "";

    // المنتجات كـ List<Map<String, dynamic>>
    final OrderController orderCtrl = Get.find<OrderController>();
    final order = orderCtrl.lastOrder; // آخر طلب

    final products = order?.products ?? [];
    final subtotal = order?.subtotal ?? 0.0;
    final shipping = order?.shipping ?? 0.0;
    final discount = order?.discount ?? 0.0;
    final total = order?.totalPrice ?? 0.0;

    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "رقم الطلب $number",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateString,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // body: Column(
        //   children: [
        //     Expanded(
        //       child: ListView.builder(
        //         itemCount: products.length,
        //         itemBuilder: (context, index) {
        //           final product = products[index];
        //           return BuildOrder2(product: product);
        //         },
        //       ),
        //     ),
        //     const SizedBox(height: 10), // 👈 مسافة بين الكروت والملخص

        //     // 👇 ملخص الفاتورة
        //     SummaryRow(title: "قيمة المشتريات", value: order?.subtotal ?? 0),
        //     SummaryRow(title: "رسوم التوصيل", value: order?.shipping ?? 0),
        //     SummaryRow(title: "الخصومات", value: order?.discount ?? 0),

        //     SummaryRow(
        //       title: "المبلغ الكلي",
        //       value: order?.totalPrice ?? 0,
        //       bold: true,
        //     ),
        //   ],
        // ),
        body: ListView(
          children: [
            // 🛒 الكروت
            ...products
                .map((product) => BuildOrder2(product: product))
                .toList(),

            const SizedBox(height: 80), // 👈 مسافة بين الكروت والملخص

            // 💰 ملخص الفاتورة
            SummaryRow(title: "قيمة المشتريات", value: subtotal),
            SummaryRow(title: "رسوم التوصيل", value: shipping),
            SummaryRow(title: "الخصومات", value: discount),
            const SizedBox(height: 16),
            SummaryRow(title: "المبلغ الكلي", value: total, bold: true),
          ],
        ),
      ),
    );
  }
}
