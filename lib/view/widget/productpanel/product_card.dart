import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/view/widget/productpanel/active_switch.dart';
import 'package:tasawoqi/view/widget/productpanel/product_info.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  final ProductPanelController controller;

  const ProductCard({
    super.key,
    required this.product,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 16),
        child: Row(
          children: [
            ActiveSwitch(index: index, controller: controller),
            const SizedBox(width: 8),
            Expanded(
                child: ProductInfo(
                    product: product, index: index, controller: controller)),
          ],
        ),
      ),
    );
  }
}
