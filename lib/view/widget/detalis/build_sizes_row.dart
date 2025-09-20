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
                    color: Appcolor.white,
                    border: Border.all(
                      color: controller.selectedSize == size
                          ? Colors.black
                          : Appcolor.lightGrey.withOpacity(0.5),
                      width: 1.5, // زدنا السماكة لضمان ظهور الحواف
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // 20% شفافية
                        // spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(size, style: const TextStyle(fontSize: 13)),
                ),
              )
          ],
        ),
      ),
      const SizedBox(width: 12),
      Text("المقاس", style: TextStyle(color: Appcolor.medigrey)),
    ],
  );
}
