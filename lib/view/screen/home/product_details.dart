import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

import '../../../controller/home/product_controller.dart';

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
                alignment: Alignment.centerRight, child: Text(product.title1))),
        body: Padding(
          padding: EdgeInsets.only(right: 24, left: 24),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                product.Image,
                height: 312,
                width: 312,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Center(
                  child: TitleOnly(
                title: '${product.title2}',
              )),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.point}",
                    style: TextStyle(color: Appcolor.aqua),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImagess.icon20),
                      SizedBox(
                        width: 8,
                      ),
                      TextWidget(
                        title: "4.5",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(AppImagess.icon21)
                    ],
                  )
                ],
              ),
              // SizedBox(
              //   height: 2,
              // ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("${product.title4}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontFamily: "Poppins", fontSize: 15)),
              ),
              SizedBox(
                height: 5,
              ),

              if (product.id == 1 && product.prepTime.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      product.prepTime,
                      style: TextStyle(fontSize: 14, color: Appcolor.yellow),
                    ),
                  ],
                ),
              if (product.id == 23 || product.id == 24) ...[
                // الألوان
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // كلمة "الألوان"

                    // دوائر الألوان
                    GetBuilder<ProductController>(
                      builder: (controller) => Row(
                        textDirection: TextDirection.rtl, // عكسي
                        children: [
                          for (int i = 0; i < product.colorHexes.length; i++)
                            GestureDetector(
                              onTap: () =>
                                  controller.changeColor(product.colorHexes[i]),
                              child: Container(
                                width: 24, // حجم الكل مع الفراغ
                                height: 24,
                                margin: EdgeInsets.only(left: 6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: controller.selectedColorHex ==
                                            product.colorHexes[i]
                                        ? Colors.black
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      1), // الفراغ الأبيض بين اللون والإطار
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(product
                                          .colorHexes[i]), // اللون الداخلي
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "الألوان",
                      style: TextStyle(
                        color: Appcolor.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // المقاسات
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // عشان يكون على اليمين
                  children: [
                    // خيارات المقاس كمستطيلات صغيرة
                    GetBuilder<ProductController>(
                        builder: (_) => Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                for (var size in product.sizes)
                                  GestureDetector(
                                    onTap: () => controller.changeSize(size),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      margin: EdgeInsets.only(left: 20),
                                      decoration: BoxDecoration(
                                        // color: controller.selectedSize == size
                                        //     ? Colors.white
                                        //     : Colors.white,
                                        border: Border.all(
                                          color: controller.selectedSize == size
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(size,
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  )
                              ],
                            )),

                    SizedBox(width: 12),
                    Text(
                      "المقاس",
                      style: TextStyle(
                        color: Appcolor.black,
                      ),
                    ),
                  ],
                ),
              ],

              SizedBox(
                height: 24,
              ),

              Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(title: "أضف ملاحظاتك")),
              Container(
                // height: 98,
                // width: 30,
                decoration: BoxDecoration(
                  color: Colors.white, // لون الخلفية
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5, // مدى نعومة الظل
                      spreadRadius: 1, // مدى انتشار الظل
                      offset: Offset(0, 0), // 0,0 يعني من كل الجهات
                    ),
                  ],
                ),
                child: TextField(
                  cursorHeight: 18, // ارتفاع المؤشر
                  cursorWidth: 2, // عرض المؤشر
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${product.title3}",
                    style: TextStyle(color: Appcolor.aqua, fontSize: 19),
                  )),
              SizedBox(
                height: 16,
              ),
              if ([4, 5, 6, 7, 8, 11, 14].contains(product.id) &&
                  product.quantity.isNotEmpty)
                GetBuilder<ProductController>(
                  builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        title: "الكمية",
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        alignment: WrapAlignment.end, // يخلي الخيارات عاليمين
                        spacing: 45, // مسافة بين الخيارات
                        children: product.quantity.map((q) {
                          return GestureDetector(
                            onTap: () => controller.changeQuantity(q),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  controller.selectedQuantity == q
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_unchecked,
                                  color: controller.selectedQuantity == q
                                      ? Appcolor.aqua
                                      : Appcolor.grey,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  q,
                                  style: TextStyle(color: Appcolor.medigrey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              // SizedBox(
              //   height: 32,
              // ),
              Buttom(text: "أضف الى السلة"),
              SizedBox(
                height: 40,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(title: 'منتجات ذات صلة'))
            ],
          ),
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
