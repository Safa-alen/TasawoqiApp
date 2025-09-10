import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/order/card_order.dart';
import 'package:tasawoqi/view/widget/order/card_order_panel.dart';
import 'package:tasawoqi/view/widget/order/tab_order.dart';

// class OrderpanelHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final args = Get.arguments as Map<String, dynamic>;
//     final String title = args["title"];
//     final int count = args["count"];

//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Scaffold(
//           appBar: AppBar(
//               title: Align(
//             alignment: AlignmentGeometry.centerRight,
//             child: TitleOnly(
//               title: title,
//             ),
//           )),
//           body: Text("lkjhbv")),
//     );
//   }
// }

class OrderpanelHome extends StatelessWidget {
  OrderpanelHome({super.key});
  final OrderController orderCtrl = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
              alignment: Alignment.centerRight,
              child: TitleOnly(title: "طلباتي")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TabOrder(orderCtrl: orderCtrl),
              const SizedBox(height: 24),
              Expanded(
                child: GetBuilder<OrderController>(
                  builder: (_) {
                    final ordersToShow = orderCtrl.selectedIndex == 0
                        ? orderCtrl.previousOrders
                        : orderCtrl.currentOrders;

                    if (ordersToShow.isEmpty) {
                      return const Center(
                        child: Text(
                          "لا توجد طلبات",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: ordersToShow.length,
                      itemBuilder: (context, index) {
                        final order = ordersToShow[index];
                        final isLast = index == ordersToShow.length - 1;
                        return CardOrderPanel(
                          order: order,
                          isLast: isLast,
                          isCurrent: orderCtrl.selectedIndex == 1,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
