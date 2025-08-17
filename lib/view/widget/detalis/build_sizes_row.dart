import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasawoqi/data/model/category_modle.dart';

import '../../../controller/home/product_controller.dart';
import '../../../core/constant/color.dart';

Widget buildSizesRow(ProductController controller, ObjctModle product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GetBuilder<ProductController>(
        builder: (_) => Row(
          textDirection: TextDirection.rtl,
          children: [
            for (var size in product.sizes)
              GestureDetector(
                onTap: () => controller.changeSize(size),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: controller.selectedSize == size
                          ? Colors.black
                          : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(size, style: const TextStyle(fontSize: 13)),
                ),
              )
          ],
        ),
      ),
      const SizedBox(width: 12),
      Text("المقاس", style: TextStyle(color: Appcolor.black)),
    ],
  );
}
