import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class TextButtom extends StatelessWidget {
  const TextButtom({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            // onTap: () {
            //   Get.toNamed(AppRoute.login); // اسم المسار حسب الموجود عندك
            // },
            child: Text(
              " هنا",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolor.aqua,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
