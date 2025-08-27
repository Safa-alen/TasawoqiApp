import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart'
    show ProductPanelController;
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';

class SwitchSize extends StatelessWidget {
  SwitchSize({super.key});
  final ProductPanelController controller = Get.find<ProductPanelController>();
  final TextEditingController sizeController = TextEditingController();

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
                  "إضافة مقاسات   ",
                  style: TextStyle(fontSize: 16, color: Appcolor.black),
                ),
                Switch(
                    value: controller.addSizes,
                    onChanged: controller.toggleSizes,
                    activeTrackColor: Appcolor.aqua,
                    inactiveThumbColor: Appcolor.white
                    // inactiveTrackColor: Color(0xFFD9D9D9),
                    ),
              ],
            ),
            if (controller.addSizes)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextfieldLocation(
                    hinttext: "المقاس",
                    controller: sizeController,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        " إضافة مقاس آخر  ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Appcolor.switchcolor,

                          borderRadius:
                              BorderRadius.circular(6), // مربع مع زوايا خفيفة
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
