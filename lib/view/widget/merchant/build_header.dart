import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/screen/home/buttom_navi_bar.dart';

Widget buildHeader(
    BuildContext context, HomeScreenControllerImp homeController) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(height: 1, color: Colors.grey.shade300),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "ملف التاجر",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.aqua,
                ),
              ),
              if (homeController.isMerchant)
                Container(height: 1, width: 150, color: Colors.teal),
            ],
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => ButtomNaviBar());
              homeController.isMerchant = false;
              homeController.changPage(4);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                "الملف الشخصي",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
