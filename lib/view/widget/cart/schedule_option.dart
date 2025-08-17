import 'package:flutter/material.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class ScheduleOption extends StatelessWidget {
  final String value, label;
  final ProductController controller;
  final bool reversed;
  const ScheduleOption({
    super.key,
    required this.value,
    required this.label,
    required this.controller,
    this.reversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final radio = Radio<String>(
      activeColor: Appcolor.aqua,
      value: value,
      groupValue: controller.scheduleOption,
      onChanged: (v) => controller.changeOption(v!),
    );
    final text = Text(label, style: TextStyle(color: Appcolor.grey));

    return Row(
      children: reversed ? [text, radio] : [radio, text],
    );
  }
}
