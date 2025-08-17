// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/home_screen_controller.dart';
// import 'package:tasawoqi/controller/home/product_controller.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/view/widget/buttom.dart';
// import 'package:tasawoqi/view/widget/detalis/counter.dart';
// import 'package:tasawoqi/view/widget/home/search_home.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart';

// class CartHome extends StatelessWidget {
//   const CartHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final homeController = Get.find<HomeScreenControllerImp>();
//     final ProductController controller = Get.put(ProductController());

//     if (homeController.cartProducts.isEmpty) {
//       return const Center(child: Text("لا يوجد منتجات في السلة"));
//     }

//     // حساب مجموع المشتريات
//     double subtotal = homeController.cartProducts.fold(
//       0.0,
//       (sum, item) => sum + item.title3.toDouble(), // title3 صار int
//     );

//     double shipping = 0.0; // رسوم التوصيل مثال
//     double discount = 0.0; // الخصم مثال
//     double totalPrice = subtotal + shipping - discount;

//     return ListView(
//       children: [
//         Column(
//           children: [
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: search_home(),
//             ),
//             const SizedBox(height: 30),

//             ...homeController.cartProducts.map((product) {
//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 57),
//                     child: Container(
//                       height: 140,
//                       width: 400,
//                       padding: const EdgeInsets.only(left: 57),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(10),
//                           bottomRight: Radius.circular(10),
//                         ),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black26,
//                             blurRadius: 5,
//                             spreadRadius: 1,
//                           )
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           // صورة المنتج
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               Container(
//                                 width: 78,
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[200],
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 0,
//                                 top: 0,
//                                 right: -30,
//                                 child: Container(
//                                   width: 80,
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     image: DecorationImage(
//                                       image: AssetImage(product.Image),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),

//                           // تفاصيل المنتج
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       TitleOnly(
//                                         title: product.title1,
//                                       ),
//                                       const Text(" / "),
//                                       Flexible(
//                                         child: Text(
//                                           overflow: TextOverflow.ellipsis,
//                                           product.title2,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyMedium,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     product.title3.toString(),
//                                     style: TextStyle(
//                                         color: Appcolor.aqua, fontSize: 19),
//                                   ),
//                                   Counter(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               );
//             }).toList(),
//             SizedBox(
//               height: 24,
//             ),

//             // 🔹 تفاصيل المشتريات
//             Padding(
//               padding: const EdgeInsets.only(right: 24.0, left: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Title(title: "قيمة المشتريات"),
//                       Text(
//                         "${subtotal.toStringAsFixed(2)} \$",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Title(
//                         title: "رسوم التوصيل",
//                       ),
//                       Text(
//                         "${shipping.toStringAsFixed(2)} \$",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Title(
//                         title: "الخصومات",
//                       ),
//                       Text(
//                         "${discount.toStringAsFixed(2)} \$",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   const Divider(height: 20, thickness: 1),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TitleOnly(title: "المبلغ الكلي"),
//                       Text(
//                         "${totalPrice.toStringAsFixed(2)} \$",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   GetBuilder<ProductController>(
//                     builder: (_) {
//                       return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Title(
//                               title: "جدولة الطلب",
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Radio<String>(
//                                         // hoverColor: Appcolor.black,
//                                         activeColor: Appcolor.aqua,
//                                         value: "datetime",
//                                         groupValue: controller.scheduleOption,
//                                         onChanged: (value) {
//                                           controller.changeOption(value!);
//                                         },
//                                       ),
//                                       Text(
//                                         "تحديد تاريخ ووقت",
//                                         style: TextStyle(color: Appcolor.grey),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "حالاً",
//                                         style: TextStyle(color: Appcolor.grey),
//                                       ),
//                                       Radio<String>(
//                                         activeColor: Appcolor.aqua,
//                                         value: "now",
//                                         groupValue: controller.scheduleOption,
//                                         onChanged: (value) {
//                                           controller.changeOption(value!);
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ]),
//                           ]);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 24, left: 24),
//               child: Buttom(text: "اطلب الآن"),
//             ),
//             SizedBox(
//               height: 20,
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }

// class Title extends StatelessWidget {
//   const Title({
//     super.key,
//     required this.title,
//   });
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: TextStyle(
//         fontSize: 16,
//         color: Appcolor.blacklight,
//         // أسود داكن قريب من الأسود الفاتح
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/product_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/cart/product_card.dart';
import 'package:tasawoqi/view/widget/cart/schedule_option.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

import '../../widget/cart/summary_row.dart';

class CartHome extends StatelessWidget {
  const CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenControllerImp>();
    final ProductController controller = Get.put(ProductController());

    if (homeController.cartProducts.isEmpty) {
      return const Center(child: Text("لا يوجد منتجات في السلة"));
    }

    // الحسابات
    final subtotal = homeController.cartProducts.fold<double>(
      0.0,
      (sum, item) => sum + item.title3.toDouble(),
    );
    const shipping = 0.0, discount = 0.0;
    final totalPrice = subtotal + shipping - discount;

    return ListView(
      children: [
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: const search_home(),
        ),
        const SizedBox(height: 32),

        // 🔹 المنتجات
        ...homeController.cartProducts
            .map((p) => CartProductCard(product: p))
            .toList(),
        const SizedBox(height: 20),

        // 🔹 ملخص الفاتورة
        SummaryRow(title: "قيمة المشتريات", value: subtotal),
        SummaryRow(title: "رسوم التوصيل", value: shipping),
        SummaryRow(title: "الخصومات", value: discount),
        const Divider(),
        SummaryRow(title: "المبلغ الكلي", value: totalPrice, bold: true),

        const SizedBox(height: 20),

        // 🔹 الجدولة
        GetBuilder<ProductController>(
          builder: (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("جدولة الطلب",
                    style: TextStyle(fontSize: 16, color: Appcolor.blacklight)),
                Padding(
                  padding: const EdgeInsets.only(left: 1.0, right: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScheduleOption(
                        value: "datetime",
                        label: "تحديد تاريخ ووقت",
                        controller: controller,
                      ),
                      ScheduleOption(
                        value: "now",
                        label: "حالاً",
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24),
          child: const Buttom(text: "اطلب الآن"),
        ),
      ],
    );
  }
}
