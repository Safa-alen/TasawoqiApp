import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';

class List_Images extends StatelessWidget {
  const List_Images({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          // شبكة الفئات (صور فقط)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // عدد الأعمدة
              mainAxisSpacing: 0, // مسافة عمودية
              crossAxisSpacing: 2, // مسافة أفقية
            ),
            itemCount: categories.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRoute.catogerType,
                    parameters: {
                      'id': categories[i].id,
                      'title': categories[i].title,
                    },
                  );
                },
                child: Image.asset(
                  categories[i].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
