import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart'
    show GetBuilder;
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/core/constant/color.dart' show Appcolor;

class ActiveSwitch extends StatelessWidget {
  final int index;
  final ProductPanelController controller;

  const ActiveSwitch(
      {super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPanelController>(
      builder: (_) => Transform.scale(
        scale: 0.9,
        child: Switch(
          activeTrackColor: Appcolor.aqua,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Appcolor.switchcolor,
          value: controller.addedProducts[index]['isActive'] ?? true,
          onChanged: (val) => controller.toggleProductActive(index, val),
        ),
      ),
    );
  }
}
