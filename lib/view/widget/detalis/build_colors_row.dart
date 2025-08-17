import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/data/model/category_modle.dart';

Widget buildColorsRow(ProductController controller, ObjctModle product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GetBuilder<ProductController>(
        builder: (_) => Row(
          textDirection: TextDirection.rtl,
          children: [
            for (int i = 0; i < product.colorHexes.length; i++)
              GestureDetector(
                onTap: () => controller.changeColor(product.colorHexes[i]),
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          controller.selectedColorHex == product.colorHexes[i]
                              ? Colors.black
                              : Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(product.colorHexes[i]),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      const SizedBox(width: 12),
      Text("الألوان", style: TextStyle(color: Appcolor.black)),
    ],
  );
}
