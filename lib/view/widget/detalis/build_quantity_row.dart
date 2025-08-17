import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/detalis/counter.dart';

import '../../../data/model/category_modle.dart';

Widget buildQuantityRow(ProductController controller, ObjctModle product) {
  return GetBuilder<ProductController>(
    builder: (_) => Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextWidget(title: "الكمية"),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.end,
          spacing: 45,
          children: product.quantity.map((q) {
            return GestureDetector(
              onTap: () => controller.changeQuantity(q),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    controller.selectedQuantity == q
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: controller.selectedQuantity == q
                        ? Appcolor.aqua
                        : Appcolor.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(q, style: TextStyle(color: Appcolor.medigrey)),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 18),
        if (controller.selectedQuantity.isNotEmpty)
          TextField(
            controller: controller.inputController,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontSize: 20, color: Appcolor.grey), // النص باللون الرمادي

            decoration: InputDecoration(
              label: Align(
                alignment: Alignment.centerRight, // محاذاة النص لليمين
                child: Text(
                  controller.getInputLabel(),
                  style: TextStyle(fontSize: 16, color: Appcolor.grey),
                ),
              ),
              // labelStyle: TextStyle(fontSize: 14, color: Appcolor.grey),
              // labelText: controller.getInputLabel(), // النص الديناميكي هنا
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Appcolor.aqua, width: 2), // لون الحد عند التركيز
              ),
            ),
            onChanged: (value) {
              controller.setSelectedInput(value); // حفظ الوزن أو القيمة
            },
          ),
      ],
    ),
  );
}
