import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/favorite_controller.dart';
import 'package:tasawoqi/data/datasource/static/categoy.dart';
import 'package:tasawoqi/view/widget/home/category_type_widget.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class FavoritesHome extends StatelessWidget {
  const FavoritesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.find<FavoriteController>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerRight,
            child: TitleOnly(title: "المفضلة"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const search_home(),
              const SizedBox(height: 24),
              Expanded(
                child: GetBuilder<FavoriteController>(
                  builder: (_) {
                    if (controller.favorites.isEmpty) {
                      return const Center(
                        child: Text("ما في عناصر بالمفضلة"),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 265,
                      ),
                      itemCount: controller.favorites.length,
                      itemBuilder: (context, i) {
                        // نجيب الفهرس الأصلي للمنتج من قائمة المفضلة
                        final productIndex = controller.favorites[i];
                        final product = BestCategories[productIndex];

                        return CategoryTypeWidget(
                          // product: product
                          image: product.Image,
                          title1: product.title1,
                          title2: product.title2,
                          title3: product.title3,
                          index: productIndex, // نمرره للتحكم بالمفضلة
                        );
                      },
                      reverse:
                          false, // هذا السطر يغير ترتيب العناصر بحيث يظهر الأول في اليمين
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
