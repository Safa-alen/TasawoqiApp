// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasawoqi/core/constant/color.dart';

class TextfieldLocation extends StatelessWidget {
  const TextfieldLocation({
    super.key,
    required this.hinttext,
    this.icon,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.verticalPadding = 12, // الافتراضي 12
  });

  final String hinttext;
  final String? icon;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3, // درجة الظل
      shadowColor: Colors.black26.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        style: TextStyle(color: Appcolor.medigrey, fontSize: 17),
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.top, // يخلي النص فوق

        // textAlignVertical: textAlignVertical, // هنا طبقنا المتغير
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
              ),
          contentPadding: EdgeInsets.only(
              top: verticalPadding, // فقط من الأعلى
              bottom: 12,
              right: 20 // مسافة صغيرة من الأسفل
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 225, 224, 224)),
          ),
          suffixIcon: null,
          prefixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SvgPicture.asset(icon!),
                )
              : null,
        ),
      ),
    );
  }
}
