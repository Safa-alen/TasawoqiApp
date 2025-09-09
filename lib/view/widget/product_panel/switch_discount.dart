import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart'
    show ProductPanelController;
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';

class SwitchDiscount extends StatelessWidget {
  SwitchDiscount({super.key});
  final ProductPanelController controller = Get.find<ProductPanelController>();
  final TextEditingController discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPanelController>(
      builder: (_) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "إضافة حسم   ",
                  style: TextStyle(fontSize: 16, color: Appcolor.black),
                ),
                Switch(
                    value: controller.addDiscount,
                    onChanged: controller.toggleDiscount,
                    activeTrackColor: Appcolor.aqua,
                    inactiveThumbColor: Appcolor.white
                    // inactiveTrackColor: Color(0xFFD9D9D9),
                    ),
              ],
            ),
            if (controller.addDiscount)
              TextfieldLocation(
                hinttext: "قيمة الحسم بالنسبة المئوية",
                controller: discountController,
              ),
          ],
        );
      },
    );
  }
}
