import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/cart/product_card.dart';
import 'package:tasawoqi/view/widget/cart/schedule_option.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import '../../../controller/home/search_controller.dart'
    show HomeSearchController;
import '../../widget/cart/summary_row.dart';

class CartHome extends StatelessWidget {
  CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenControllerImp>();
    final ProductController productCtrl = Get.put(ProductController());
    final PaymentController paymentCtrl = Get.find<PaymentController>();

    if (homeController.cartProducts.isEmpty) {
      return const Center(child: Text("لا يوجد منتجات في السلة"));
    }

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: search_home(),
        ),
        const SizedBox(height: 32),
        ...homeController.cartProducts
            .map((p) => CartProductCard(product: p))
            .toList(),
        const SizedBox(height: 20),
        SummaryRow(title: "قيمة المشتريات", value: subtotal),
        SummaryRow(title: "رسوم التوصيل", value: shipping),
        SummaryRow(title: "الخصومات", value: discount),
        const Divider(),
        SummaryRow(title: "المبلغ الكلي", value: totalPrice, bold: true),
        const SizedBox(height: 20),
        GetBuilder<ProductController>(
          builder: (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("جدولة الطلب",
                    style: TextStyle(fontSize: 16, color: Appcolor.blacklight)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScheduleOption(
                      value: "now",
                      label: "حالاً",
                      controller: productCtrl,
                    ),
                    ScheduleOption(
                      value: "datetime",
                      label: "تحديد تاريخ ووقت",
                      controller: productCtrl,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Buttom(
            text: "اطلب الآن",
            onPressed: () {
              Get.toNamed(
                AppRoute.paymentHome,
                arguments: {
                  "products": List.from(homeController.cartProducts),
                  "subtotal": subtotal,
                  "shipping": shipping,
                  "discount": discount,
                  "totalPrice": totalPrice,
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
