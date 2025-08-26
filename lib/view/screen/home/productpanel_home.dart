import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class ProductPanelHome extends StatelessWidget {
  const ProductPanelHome({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
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
            padding: const EdgeInsets.only(right: 8.0, left: 8, top: 24),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center, // وسط عمودياً

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
                    search_home(
                      height: 40,
                      width: 220,
                      showPrefixIcon: false,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
