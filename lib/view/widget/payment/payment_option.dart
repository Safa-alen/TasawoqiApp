import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import '../../../core/constant/color.dart';

class PaymentOption extends StatelessWidget {
  final String value;
  final String label;

  const PaymentOption({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find<PaymentController>();

    return RadioListTile<String>(
      value: value,
      groupValue: controller.selectedOption2,
      onChanged: (val) => controller.selectOption2(val!),
      title: Text(
        label,
        style: TextStyle(color: Appcolor.black, fontSize: 16),
        textAlign: TextAlign.right,
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: Appcolor.aqua,
    );
  }
}
