import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagess.dart';

class AddressField extends StatelessWidget {
  final String type;
  final String label;
  final String hint;
  final TextEditingController controllerText;
  final FocusNode focusNode;

  const AddressField({
    super.key,
    required this.type,
    required this.label,
    required this.hint,
    required this.controllerText,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find<PaymentController>();

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
                value: type,
                groupValue: controller.selectedOption1,
                onChanged: (value) => controller.selectOption1(value!),
                title: Text(label,
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15)),
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: Appcolor.aqua,
              ),
              TextField(
                focusNode: focusNode,
                controller: controllerText,
                maxLines: 3,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14, color: Appcolor.myGrey),
                enabled: controller.selectedOption1 == type,
                onChanged: type == 'home'
                    ? controller.updateHomeNote
                    : controller.updateOfficeNote,
                decoration: InputDecoration(
                  hintText: hint,
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
          top: type == 'home' ? 15 : 25,
          left: type == 'home' ? 15 : 25,
          child: InkWell(
            onTap: () => FocusScope.of(context).requestFocus(focusNode),
            child: SvgPicture.asset(AppImagess.icon22, color: Appcolor.grey),
          ),
        ),
      ],
    );
  }
}
