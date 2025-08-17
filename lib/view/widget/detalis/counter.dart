import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Container(
      margin: EdgeInsets.all(4),
      height: 44,
      width: 120,
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5, // مدى نعومة الظل
            spreadRadius: 1, // مدى انتشار الظل
            offset: Offset(0, 0), // 0,0 يعني من كل الجهات
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // زر زيادة
            IconButton(
              icon: Icon(Icons.remove, color: Appcolor.medigrey),
              onPressed: controller.decrement,
            ),
            // الرقم بالنص
            Text(
              "${controller.count}",
              style: TextStyle(
                  color: Appcolor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            // زر إنقاص

            IconButton(
              icon: Icon(Icons.add, color: Appcolor.medigrey),
              onPressed: controller.increment,
            ),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15));
  }
}
