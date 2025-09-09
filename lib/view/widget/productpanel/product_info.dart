import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/productpanel/action_buttons.dart';

class ProductInfo extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  final ProductPanelController controller;

  const ProductInfo(
      {super.key,
      required this.product,
      required this.index,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(product['name'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Appcolor.black)),
        const SizedBox(height: 4),
        Text(product['price'],
            style: TextStyle(
                color: Appcolor.aqua,
                fontSize: 19,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(product['description'],
            maxLines: 2, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        ActionButtons(index: index, controller: controller),
      ],
    );
  }
}
