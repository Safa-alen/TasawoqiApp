import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/view/widget/productpanel/product_card.dart';

class CartPanelProduct extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  const CartPanelProduct(
      {super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductPanelController>();
    final File image = product['image'];

    return SizedBox(
      height: 145,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ProductCard(product: product, index: index, controller: controller),
          Positioned(
            right: 1,
            top: 30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:
                    DecorationImage(image: FileImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
