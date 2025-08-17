import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/cart/product_card.dart';
import 'package:tasawoqi/view/widget/cart/schedule_option.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';

import '../../widget/cart/summary_row.dart';

class CartHome extends StatelessWidget {
  const CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenControllerImp>();
    final ProductController controller = Get.put(ProductController());

    if (homeController.cartProducts.isEmpty) {
      return const Center(child: Text("لا يوجد منتجات في السلة"));
    }

    // الحسابات
    final subtotal = homeController.cartProducts.fold<double>(
      0.0,
      (sum, item) => sum + item.title3.toDouble(),
    );
    const shipping = 0.0, discount = 0.0;
    final totalPrice = subtotal + shipping - discount;

    return ListView(
      children: [
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: const search_home(),
        ),
        const SizedBox(height: 32),

        // 🔹 المنتجات
        ...homeController.cartProducts
            .map((p) => CartProductCard(product: p))
            .toList(),
        const SizedBox(height: 20),

        // 🔹 ملخص الفاتورة
        SummaryRow(title: "قيمة المشتريات", value: subtotal),
        SummaryRow(title: "رسوم التوصيل", value: shipping),
        SummaryRow(title: "الخصومات", value: discount),
        const Divider(),
        SummaryRow(title: "المبلغ الكلي", value: totalPrice, bold: true),

        const SizedBox(height: 20),

        // 🔹 الجدولة
        GetBuilder<ProductController>(
          builder: (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("جدولة الطلب",
                    style: TextStyle(fontSize: 16, color: Appcolor.blacklight)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScheduleOption(
                      value: "datetime",
                      label: "تحديد تاريخ ووقت",
                      controller: controller,
                    ),
                    ScheduleOption(
                      value: "now",
                      label: "حالاً",
                      controller: controller,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24),
          child: Buttom(
            text: "اطلب الآن",
            onPressed: () {
              Get.toNamed(AppRoute.paymentHome);
            },
          ),
        ),
      ],
    );
  }
}
