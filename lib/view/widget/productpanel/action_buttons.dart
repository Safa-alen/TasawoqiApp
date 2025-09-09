import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart' show AppRoute;

class ActionButtons extends StatelessWidget {
  final int index;
  final ProductPanelController controller;

  const ActionButtons(
      {super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined), // لازم يكون Icon هنا
              color: Appcolor.aqua,
              onPressed: () {
                Get.toNamed(AppRoute.addProductPanel, arguments: {
                  ...controller.addedProducts[index],
                  'index': index
                });
              }),
          const SizedBox(width: 6),
          IconButton(
              icon: Icon(Icons.delete_outline),
              color: Colors.red,
              onPressed: () => controller.removeProduct(index)),
        ],
      ),
    );
  }
}
