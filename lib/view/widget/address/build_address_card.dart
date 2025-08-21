import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart' show Get;
import 'package:tasawoqi/controller/home/payment_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart' show AppImagess;

Widget buildAddressCard({
  required BuildContext context,
  required String title,
  required PaymentController controller,
  required String selectedValue,
  required FocusNode focusNode,
  required TextEditingController textController,
  required String hintText,
  required Function(String) onChanged,
}) {
  return Stack(
    children: [
      Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            RadioListTile<String>(
              value: selectedValue,
              groupValue: controller.selectedOption1,
              onChanged: (value) => controller.selectOption1(value!),
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 15),
                textAlign: TextAlign.right,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Appcolor.aqua,
            ),
            TextField(
              focusNode: focusNode,
              controller: textController,
              maxLines: 3,
              textAlign: TextAlign.right,
              onChanged: onChanged,
              enabled: controller.selectedOption1 == selectedValue,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Appcolor.grey),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 19),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 15,
        left: 15,
        child: InkWell(
          onTap: () => FocusScope.of(Get.context!).requestFocus(focusNode),
          child: SvgPicture.asset(AppImagess.icon22, color: Appcolor.grey),
        ),
      ),
    ],
  );
}
