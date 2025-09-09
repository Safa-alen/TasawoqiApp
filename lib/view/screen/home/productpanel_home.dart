import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/productpanel/product_list.dart';
import 'package:tasawoqi/view/widget/productpanel/top_row.dart' show TopRow;

class ProductPanelHome extends StatelessWidget {
  const ProductPanelHome({super.key});

  @override
  Widget build(BuildContext context) {
    final productCtrl = Get.put(ProductPanelController());
    productCtrl.setShowFilters(false);

    final args = Get.arguments as Map<String, dynamic>?;
    final title = args?['title'] ?? 'المنتجات';

    // إذا جت فلترة من البحث
    if (args != null && args.containsKey('filterCategory')) {
      productCtrl.selectedUnit3 = args['filterCategory'];
      productCtrl.filterProductsByCategory(productCtrl.selectedUnit3);
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: AlignmentGeometry.centerRight,
            child: TitleOnly(title: title),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24, top: 20),
          child: Column(
            children: [
              TopRow(),
              const SizedBox(height: 24),
              Expanded(child: ProductList()),
            ],
          ),
        ),
      ),
    );
  }
}
