import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class TmHome extends StatelessWidget {
  TmHome({super.key});
  final OrderController orderCtrl = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: TitleOnly(title: "لقد تم إرسال الطلب      ")),
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "رقم الطلب ${orderCtrl.orderNumber}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 104),
            SizedBox(
              height: 88,
              width: 88,
              child: CircularProgressIndicator(color: Appcolor.aqua),
            ),
            const SizedBox(height: 144),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, left: 24),
              child: Buttom(
                text: "العودة للصفحة الرئيسية",
                onPressed: () {
                  final homeController = Get.find<HomeScreenControllerImp>();
                  Get.offNamed(AppRoute.buttomNavBar);
                  homeController.changPage(0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
