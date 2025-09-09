import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tasawoqi/core/constant/color.dart' show Appcolor;
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/product_panel/search_panel.dart';

class TopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Appcolor.aqua,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 40,
          width: 115,
          child: MaterialButton(
            onPressed: () => Get.toNamed(AppRoute.addProductPanel),
            child: Text("إضافة منتج",
                style: TextStyle(color: Appcolor.white, fontSize: 14)),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(child: SearchPanel()),
      ],
    );
  }
}
