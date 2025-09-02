// كرت الطلب
import 'dart:ui' as ui show TextDirection;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show StatelessWidget, Widget, Card, Colors;
import 'package:get/get.dart' show Get;
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/buttom.dart' show Buttom;
import 'package:tasawoqi/view/widget/order/build_order_row.dart'
    show buildOrderRow;
import 'package:tasawoqi/view/widget/order/build_detail_row.dart';

import '../../../controller/home/order_controller.dart';
import 'previous_request_order.dart';

class CardOrder extends StatelessWidget {
  final order;
  final bool isLast;
  final bool isCurrent;

  const CardOrder({
    super.key,
    required this.order,
    required this.isLast,
    required this.isCurrent,
  });

  String get displayPayment => order.payment == 'cash'
      ? 'عند الاستلام'
      : order.payment == 'app'
          ? 'التطبيق'
          : order.payment;

  String get displayAddress => order.address == 'home'
      ? 'منزل'
      : order.address == 'office'
          ? 'مكتب'
          : '—';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildOrderRow(order.number, order.date),
            if (isCurrent) buildDetailRow("حالة الطلب", order.status),
            buildDetailRow("العنوان", displayAddress),
            buildDetailRow("طريقة الدفع", displayPayment),
            buildDetailRow(
                "المبلغ الإجمالي", "₺${order.totalPrice.toStringAsFixed(2)}",
                valueColor: Appcolor.aqua),
            const SizedBox(height: 16),
            if (isCurrent && isLast)
              Row(children: [
                Expanded(
                  child: Buttom(
                    text: "إلغاء",
                    onPressed: () =>
                        Get.find<OrderController>().removeOrder(order),
                  ),
                ),
              ]),
            if (!isCurrent) PreviousRequestOrder(order: order),
          ]),
        ),
      ),
    );
  }
}
