///////العملة وحدات القياس
import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class OptionSelectorWidget extends StatelessWidget {
  final String title; // العنوان مثل "وحدة قياس" أو "العملة"
  final List<String> options; // الخيارات
  final String selectedValue; // القيمة المحددة حالياً
  final ValueChanged<String> onChanged; // عند التغيير

  const OptionSelectorWidget({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // كل شي يضل عاليمين
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
          ),
        ),
        const SizedBox(height: 16),

        // الخيارات
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: options.map((option) {
            final isSelected = option == selectedValue;
            return Padding(
              padding:
                  const EdgeInsets.only(left: 26.0), // مسافة بسيطة بين الخيارات
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    option,
                    style: TextStyle(
                      fontSize: 14, // أصغر شوي ليبين مرتب
                      color: isSelected ? Appcolor.aqua : Appcolor.textGrey,
                    ),
                  ),
                  Radio<String>(
                    value: option,
                    groupValue: selectedValue,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ), // لتصغير حجم الراديو
                    activeColor: isSelected ? Appcolor.aqua : Appcolor.textGrey,
                    onChanged: (value) {
                      if (value != null) onChanged(value);
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
