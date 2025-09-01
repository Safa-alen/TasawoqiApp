// Footer الطلب السابق
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:tasawoqi/core/constant/color.dart';

class PreviousRequestOrder extends StatelessWidget {
  final order;
  const PreviousRequestOrder({required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () =>
              Get.toNamed('/ratingPage', arguments: {'order': order}),
          style: ElevatedButton.styleFrom(
              backgroundColor: Appcolor.aqua,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: const Text("تقييم", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("تم توصيل الطلب",
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              Text("شكراً لاستخدامك تطبيقنا",
                  style: TextStyle(fontSize: 12, color: Appcolor.aqua)),
            ],
          ),
        ),
        const SizedBox(width: 5),
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/order.png'),
        ),
      ],
    );
  }
}
