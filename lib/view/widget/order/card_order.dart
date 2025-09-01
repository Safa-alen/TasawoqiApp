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

import '../../../controller/home/order_controller.dart';
import '../previous_request_order.dart';

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
            _buildOrderRow(order.number, order.date),
            if (isCurrent) _buildDetailRow("حالة الطلب", order.status),
            _buildDetailRow("العنوان", displayAddress),
            _buildDetailRow("طريقة الدفع", displayPayment),
            _buildDetailRow(
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

  Widget _buildDetailRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: valueColor ?? Appcolor.grey)),
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildOrderRow(String number, DateTime date) {
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
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16)),
        ],
      ),
    );
  }
}
