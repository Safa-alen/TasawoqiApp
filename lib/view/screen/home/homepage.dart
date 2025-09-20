import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tasawoqi/controller/home/api_product_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/datasource/static/categoy.dart';
import 'package:tasawoqi/data/datasource/static/recommstore.dart';
import 'package:tasawoqi/view/widget/home/category_type_widget.dart';
import 'package:tasawoqi/view/widget/home/recommstore_list.dart';
import 'package:tasawoqi/view/widget/home/row_textbuttom_home.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import '../../widget/home/category_list_home.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        init: HomeScreenControllerImp()..fetchProducts(),
        builder: (controller) {
          return ListView(
              physics: const AlwaysScrollableScrollPhysics(), // 🔥 مهم جدًا

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      search_home(),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        child: Image.asset(AppImagess.home, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 24),
                      Row_textbuttom(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      category_list_home(),
                      const SizedBox(height: 30),
                      TitleOnly(title: "متاجر موصى بها"),
                      const SizedBox(height: 10),
                      RecommstoreList(),
                      const SizedBox(height: 25),
                      TitleOnly(title: "المنتجات الأكثر طلباً "),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 265,
                          ),
                          // itemCount: BestCategories.length,
                          // itemBuilder: (context, index) {
                          //   final product = BestCategories[index];
                          //   return CategoryTypeWidget(
                          //     image: product.Image,
                          //     title1: product.title1,
                          //     title2: product.title2,
                          //     title3: product.title3,
                          //     index: index,
                          //     //product: product
                          //   );
                          // },
                          itemCount: BestCategories.length,
                          itemBuilder: (context, index) {
                            final bestCategories = BestCategories[index];
                            return CategoryTypeWidget(
                              product: bestCategories,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
        });
  }
}
