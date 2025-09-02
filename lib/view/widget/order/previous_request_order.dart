// Footer الطلب السابق
import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/widget/order/showrating_dialog.dart'
    show showRatingDialog;

// Import للـ Rating Dialog وController

class PreviousRequestOrder extends StatelessWidget {
  final dynamic order;
  const PreviousRequestOrder({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // فتح نافذة التقييم عند الضغط
            showRatingDialog(context, order);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolor.aqua,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("تقييم", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "تم توصيل الطلب",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              Text(
                "شكراً لاستخدامك تطبيقنا",
                style: TextStyle(fontSize: 12, color: Appcolor.aqua),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(AppImagess.cat1),
        ),
      ],
    );
  }
}
