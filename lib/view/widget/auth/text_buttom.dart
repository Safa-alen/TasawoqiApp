import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tasawoqi/core/constant/color.dart';

import '../../../core/constant/route.dart';

class TextButtom extends StatelessWidget {
  const TextButtom({
    super.key,
    required this.text,
  });
  final String text;
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
            onTap: () {
              Get.toNamed(AppRoute.login); // اسم المسار حسب الموجود عندك
            },
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
