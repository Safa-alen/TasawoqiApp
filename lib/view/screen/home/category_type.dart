import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/view/widget/home/category_type_widget.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';

class CategoryTypeHome extends StatelessWidget {
  const CategoryTypeHome(
      {super.key, required this.categoryId, required this.categoryTitle});
  final String categoryId;
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final categoryId = Get.parameters['id'] ?? '';
    final categoryTitle = Get.parameters['title'] ?? '';

    final filterCategory = object.where((category) {
      return category.id.toString() == categoryId;
    }).toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerRight, child: Text(categoryTitle)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 24,
              ),
              search_home(),
              SizedBox(
                height: 24,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filterCategory.length,
                itemBuilder: (context, index) {
                  final product =
                      filterCategory[index]; // المنتج الحالي في الفهرس
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        AppRoute.productDetails,
                        arguments: product, // تمرير المنتج المضغوط فقط
                      );
                    },
                    child: CategoryTypeWidget(
                      images: [product.Image], // لو الكلاس widget يحتاج قائمة
                      titles1: [product.title1],
                      titles2: [product.title2],
                      titles3: [product.title3],
                    ),
                  );
                },
              ),

              // InkWell(
              //   onTap: () {
              //     Get.toNamed(AppRoute.productDetails );
              //   },
              //   child: CategoryTypeWidget(
              //     images: filterCategory.map((e) => e.Image).toList(),
              //     titles1: filterCategory.map((e) => e.title1).toList(),
              //     titles2: filterCategory.map((e) => e.title2).toList(),
              //     titles3: filterCategory.map((e) => e.title3).toList(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
