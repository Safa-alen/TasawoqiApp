import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/detalis/build_colors_row.dart';
import 'package:tasawoqi/view/widget/detalis/build_notes_row.dart';
import 'package:tasawoqi/view/widget/detalis/build_quantity_row.dart';
import 'package:tasawoqi/view/widget/detalis/build_sizes_row.dart';
import 'package:tasawoqi/view/widget/detalis/counter.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ObjctModle product = Get.arguments;
    final ProductController controller = Get.put(ProductController());

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(product.title1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              // صورة المنتج
              Image.asset(
                product.Image,
                height: 312,
                width: 312,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),

              // العنوان الفرعي
              Center(child: TitleOnly(title: product.title2)),
              const SizedBox(height: 16),

              // النقاط والتقييم
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${product.point}",
                      style: TextStyle(color: Appcolor.aqua)),
                  Row(
                    children: [
                      SvgPicture.asset(AppImagess.icon20),
                      const SizedBox(width: 8),
                      TextWidget(title: "4.5"),
                      const SizedBox(width: 8),
                      SvgPicture.asset(AppImagess.icon21),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),

              // الوصف
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  product.title4,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontFamily: "Poppins", fontSize: 15),
                ),
              ),
              const SizedBox(height: 5),

              // وقت التحضير
              if (product.id == "1" && product.prepTime.isNotEmpty)
                Text(product.prepTime,
                    style: TextStyle(fontSize: 14, color: Appcolor.yellow)),

              const SizedBox(height: 16),

              // الألوان والمقاسات
              if (product.id == "23" || product.id == "24") ...[
                buildColorsRow(controller, product),
                const SizedBox(height: 16),
                buildSizesRow(controller, product),
              ],

              const SizedBox(height: 24),

              // ملاحظات المستخدم
              Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(title: "أضف ملاحظاتك")),
              buildNotesField(),

              const SizedBox(height: 20),

              // عداد المنتج والسعر
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<ProductController>(builder: (_) => Counter()),
                  Text("${product.title3}",
                      style: TextStyle(color: Appcolor.aqua, fontSize: 19)),
                ],
              ),
              const SizedBox(height: 16),

              // اختيار الكمية
              if (["4", "5", "6", "7", "8", "11", "14"].contains(product.id) &&
                  product.quantity.isNotEmpty)
                buildQuantityRow(controller, product),

              const SizedBox(height: 32),

              // زر الإضافة للسلة
              Buttom(
                text: 'أضف الى السلة',
                onPressed: () {
                  final homeController = Get.find<HomeScreenControllerImp>();
                  homeController.addProductToCart(product);
                  Get.snackbar(
                    "تم الإضافة",
                    "${product.title1} أضيف إلى السلة",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),

              const SizedBox(height: 40),

              Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(title: 'منتجات ذات صلة')),
            ],
          ),
        ),
      ),
    );
  }
}
