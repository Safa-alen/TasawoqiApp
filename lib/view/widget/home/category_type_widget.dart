// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/cart_controller.dart';
// import 'package:tasawoqi/controller/home/favorite_controller.dart';
// import 'package:tasawoqi/core/constant/color.dart';

// class CategoryTypeWidget extends StatelessWidget {
//   final String image;
//   final String title1;
//   final String title2;
//   final dynamic title3;
//   final int index;

//   const CategoryTypeWidget({
//     super.key,
//     required this.image,
//     required this.title1,
//     required this.title2,
//     required this.title3,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final FavoriteController controller = Get.find<FavoriteController>();
//     final CartController cartController = Get.put(CartController());

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(12)),
//                   child: Image.asset(
//                     image,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(title1, style: Theme.of(context).textTheme.bodySmall),
//                     const SizedBox(height: 5),
//                     Text(
//                       title2,
//                       maxLines: 1,
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                     ),
//                     Text(
//                       title3.toString(),
//                       maxLines: 1,
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                             fontFamily: 'Poppins',
//                             color: Appcolor.aqua,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               //const Spacer(),

//               SizedBox(
//                 height: 5,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Align(
//                   alignment: Alignment.center, // لتوسيط الزر
//                   child: Container(
//                     height: 30,
//                     width: 150, // عرض مناسب داخل الكارد
//                     decoration: BoxDecoration(
//                       color: Appcolor.aqua,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.add, color: Colors.white),
//                       onPressed: () {

//                       },
//                       padding: EdgeInsets.zero,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // القلب باستخدام GetBuilder
//           Positioned(
//             top: 4,
//             right: 4,
//             child: GetBuilder<FavoriteController>(
//               builder: (controller) {
//                 final isFav = controller.isFavorite(index);
//                 return GestureDetector(
//                   onTap: () => controller.toggleFavorite(index),
//                   child: Icon(
//                     isFav ? Icons.favorite : Icons.favorite_border,
//                     color: isFav ? Colors.red : Colors.grey,
//                     size: 25,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/cart_controller.dart';
import 'package:tasawoqi/controller/home/favorite_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class CategoryTypeWidget extends StatelessWidget {
  final String image;
  final String title1;
  final String title2;
  final dynamic title3;
  final int index;

  const CategoryTypeWidget({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final FavoriteController favController = Get.find<FavoriteController>();
    final CartController cartController = Get.put(CartController());

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title1, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 5),
                    Text(
                      title2,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      title3.toString(),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontFamily: 'Poppins',
                            color: Appcolor.aqua,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Appcolor.aqua,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        cartController.addToCart({
                          "image": image,
                          "title1": title1,
                          "title2": title2,
                          "title3": title3,
                          "index": index,
                        });
                        Get.snackbar(
                          'تمت الإضافة',
                          '$title1 تم إضافته إلى السلة',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.withOpacity(0.7),
                          colorText: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GetBuilder<FavoriteController>(
              builder: (_) {
                final isFav = favController.isFavorite(index);
                return GestureDetector(
                  onTap: () => favController.toggleFavorite(index),
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : Colors.grey,
                    size: 25,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
