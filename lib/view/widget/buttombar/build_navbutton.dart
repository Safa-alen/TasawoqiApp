import 'package:flutter/material.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

Widget buildNavButton({
  required Widget icon,
  required int index,
  required HomeScreenControllerImp controller,
}) {
  return MaterialButton(
    minWidth: 50,
    onPressed: () => controller.changPage(index),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 8),
        if (controller.currentpage == index)
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Appcolor.aqua,
              shape: BoxShape.circle,
            ),
          ),
      ],
    ),
  );
}
