import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:flutter/widgets.dart' as ui;

class OrderHome extends StatelessWidget {
  OrderHome({super.key});
  final OrderController orderCtrl = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr, // لغة عربية
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TitleOnly(title: "طلباتي"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Tabs
              GetBuilder<OrderController>(
                builder: (_) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(height: 1, color: Colors.grey.shade300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTab(
                            title: "الطلبات السابقة",
                            isSelected: orderCtrl.selectedIndex == 0,
                            onTap: () => orderCtrl.changeTab(0),
                          ),
                          _buildTab(
                            title: "الطلبات الحالية",
                            isSelected: orderCtrl.selectedIndex == 1,
                            onTap: () => orderCtrl.changeTab(1),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              // Orders List
              Expanded(
                child: GetBuilder<OrderController>(
                  builder: (_) {
                    if (orderCtrl.selectedIndex == 1) {
                      return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // صف رقم الطلب + التاريخ
                                      _buildOrderRow(
                                        orderNumber: orderCtrl.orderNumber,
                                        orderDate: orderCtrl.orderDate,
                                      ),
                                      _buildDetailRow(
                                          "حالة الطلب", "قيد التحضير"),
                                      _buildDetailRow(
                                          "العنوان", orderCtrl.address),
                                      _buildDetailRow(
                                          "طريقة الدفع", orderCtrl.payment),
                                      _buildDetailRow(
                                        "المبلغ الإجمالي",
                                        "₺${orderCtrl.totalPrice.toStringAsFixed(2)}",
                                        valueColor: Appcolor.aqua,
                                      ),

                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Buttom(
                                              text: "إلغاء",
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "لا توجد طلبات سابقة",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لبناء التاب
  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Appcolor.aqua : Appcolor.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 150,
              color: Appcolor.aqua,
            ),
        ],
      ),
    );
  }

  // دالة لبناء صف التفاصيل
  Widget _buildDetailRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: valueColor ?? Appcolor.grey,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // دالة لبناء صف رقم الطلب + التاريخ
  Widget _buildOrderRow({required String orderNumber, DateTime? orderDate}) {
    final dateString = orderDate != null
        ? DateFormat("d MMM yyyy, hh:mm a").format(orderDate)
        : "—";

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: ui.TextDirection.rtl, // لضمان RTL
        children: [
          Text(
            "رقم الطلب $orderNumber",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
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
    );
  }
}
