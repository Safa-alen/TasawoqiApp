import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/panel/search_panel.dart';

class ProductPanelHome extends StatelessWidget {
  const ProductPanelHome({super.key});

  @override
  Widget build(BuildContext context) {
    final productCtrl = Get.put(ProductPanelController());
    productCtrl.setShowFilters(false);

    final args = Get.arguments as Map<String, dynamic>?;
// إذا جت فلترة من البحث، حطها مباشرة كـ selectedUnit3
    if (args != null && args.containsKey('filterCategory')) {
      productCtrl.selectedUnit3 = args['filterCategory'];
      productCtrl.filterProductsByCategory(productCtrl.selectedUnit3);
    }

    // final args = Get.arguments as Map<String, dynamic>?;
    final title = args?['title'] ?? 'المنتجات';

    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Align(
                alignment: AlignmentGeometry.centerRight,
                child: TitleOnly(title: title)),
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 24, top: 20),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // ✅ خليه ثابت بالأعلى

                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //  crossAxisAlignment: CrossAxisAlignment.center, // وسط عمودياً

                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Appcolor.aqua,
                          borderRadius: BorderRadius.circular(8)),
                      height: 40,
                      width: 115,
                      child: MaterialButton(
                        onPressed: () {
                          Get.toNamed(
                            AppRoute.addProductPanel,
                          );
                        },
                        child: Text(
                          "إضافة منتج",
                          style: TextStyle(color: Appcolor.white, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(child: SearchPanel()),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GetBuilder<ProductPanelController>(
                  builder: (controller) {
                    // final productsToShow =
                    //     controller.filteredProducts.isNotEmpty
                    //         ? controller.filteredProducts
                    //         : controller.addedProducts;
                    final productsToShow = controller.selectedOption.isEmpty ||
                            controller.selectedOption == 'لاشيئ'
                        ? controller.addedProducts // كل المنتجات
                        : controller.filteredProducts; // المنتجات المطابقة

                    return ListView.separated(
                      shrinkWrap: true, // مهم
                      physics:
                          NeverScrollableScrollPhysics(), // منع التمرير المزدوج

                      // scrollDirection: Axis.vertical,
                      itemCount: productsToShow.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final product = productsToShow[index];
                        return CartPanelProduct(
                          product: product,
                          index: index,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class CartPanelProduct extends StatelessWidget {
  final Map<String, dynamic> product; // ✅ نستقبل المنتج

  final int index; // index العنصر في القائمة
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CartPanelProduct({
    super.key,
    required this.product,
    required this.index,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductPanelController>();

    final String productName = product['name'];
    final String description = product['description'];
    final String price = product['price'];
    final File image = product['image'];

    return SizedBox(
      height: 140,
      child: Stack(
        clipBehavior: Clip.none, // يسمح للصورة بالخروج
        children: [
          // الخلفية والـ Container الرئيسي
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: 30), // مساحة للصورة
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            //padding: const EdgeInsets.only(left: 150, top: 16),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 90.0,
                    ),
                    child: GetBuilder<ProductPanelController>(
                      builder: (controller) {
                        return Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            //     ctiveColor: Colors.white, // لون المؤشر عند التفعيل
                            activeTrackColor:
                                Appcolor.aqua, // لون الخلفية عند التفعيل
                            inactiveThumbColor:
                                Colors.white, // المؤشر عند الإيقاف
                            inactiveTrackColor:
                                Appcolor.switchcolor, // الخلفية عند الإيقاف
                            value: product['isActive'] ?? true,
                            onChanged: (val) {
                              controller.toggleProductActive(
                                  index, val); // يغيّر الحالة
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      textDirection:
                          TextDirection.ltr, // الاتجاه من اليمين لليسار

                      children: [
                        Text(productName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Appcolor.black)),
                        const SizedBox(height: 4),
                        Text(price,
                            style: TextStyle(
                                color: Appcolor.aqua,
                                fontSize: 19,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 28,
                                width: 32,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12, // ظل خفيف
                                      blurRadius: 4, // نعومة الظل
                                      offset: Offset(1, 1), // اتجاه الظل
                                    ),
                                  ],
                                  color: Appcolor.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(Icons.edit_outlined,
                                      size: 18, color: Appcolor.aqua),
                                  onPressed: () {
                                    Get.toNamed(
                                      AppRoute.addProductPanel,
                                      arguments: {
                                        ...product,
                                        'index':
                                            index, // هذا مهم لتعديل المنتج الصحيح
                                      },
                                    ); // هنا دالة التعديل
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              // زر الحذف
                              Container(
                                height: 28,
                                width: 32,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12, // ظل خفيف
                                      blurRadius: 4, // نعومة الظل
                                      offset: Offset(1, 1), // اتجاه الظل
                                    ),
                                  ],
                                  color: Appcolor.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(
                                    Icons.delete_outline,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    controller
                                        .removeProduct(index); // هنا دالة الحذف
                                  },
                                ),
                              ),

                              // زر التعديل
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // الصورة
          Positioned(
            right: 1,
            top: 30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:
                    DecorationImage(image: FileImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
