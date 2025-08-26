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
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Align(
              alignment: Alignment.centerRight, child: Text(categoryTitle)),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Get.back(); // ترجع للصفحة السابقة
          //   },
          // ),
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
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: 265.0,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filterCategory.length,
                itemBuilder: (context, index) {
                  final product = filterCategory[index];
                  final originalIndex =
                      BestCategories.indexWhere((p) => p.id == product.id);
                  // المنتج الحالي في الفهرس
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        AppRoute.productDetails,
                        arguments: product, // تمرير المنتج المضغوط فقط
                      );
                    },
                    child: CategoryTypeWidget(
                      image: product.Image,
                      title1: product.title1,
                      title2: product.title2,
                      title3: product.title3,
                      index: originalIndex,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
