// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:tasawoqi/data/datasource/categoy.dart';

// class Hhhh extends StatelessWidget {
//   const Hhhh({super.key, required this.text});
// final String text;
//   @override
//   Widget build(BuildContext context) {

//      final routeArgument = ModalRoute.of(context)!.settings.arguments
//         as Map; //هون عم ناخد البيانات يلي تم تمريرها عند الانتقال للشاشة،
//  //هون عم نستخرج قيمة id و title من الماب.
//     final categoryTitle = routeArgument['title'];
//  final categoryImage = routeArgument['image'];

//     final filtercategories = categories.where((categories) {
//       //هون عم نستخرج قيمة id و title من الماب.
//       return categories.contains(categoryTitle);
//     }).toList();
//     return  Scaffold(
// appBar: AppBar(title:text),

//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/view/widget/home/category_best_use.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class CategoryType extends StatelessWidget {
  const CategoryType(
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Align(
            alignment: Alignment.centerRight,
            child: TitleOnly(title: categoryTitle)),
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
            category_best_use(
              images: filterCategory.map((e) => e.Image).toList(),
              titles1: filterCategory.map((e) => e.title1).toList(),
              titles2: filterCategory.map((e) => e.title2).toList(),
              titles3: filterCategory.map((e) => e.title3).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
