// // }
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:tasawoqi/core/constant/color.dart';

// class CategoryTypeWidget extends StatelessWidget {
//   const CategoryTypeWidget({
//     super.key,
//     required this.image,
//     required this.title1,
//     required this.title2,
//     required this.title3,
//   });

//   final String image;
//   final String title1;
//   final String title2;
//   final String title3;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child:Stack (
//         children:[ Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // صورة
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.asset(
//                 image,
//                 height: 132,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.only(right: 9),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title1, style: Theme.of(context).textTheme.bodySmall),
//                   const SizedBox(height: 5),
//                   Text(
//                     title2,
//                     maxLines: 1,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                         ),
//                   ),
//                   Text(
//                     title3,
//                     maxLines: 1,
//                     style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           fontFamily: 'Poppins',
//                           color: Appcolor.aqua,
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 4,
//             ),
//             //const Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(right: 12.0, bottom: 10),
//               child: Container(
//                 height: 28,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: Appcolor.aqua,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: IconButton(
//                   icon: const Icon(Icons.add, color: Colors.white),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             )
//           ],
//         ),
//      ] ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final FavoriteController controller = Get.find<FavoriteController>();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: 4,
              ),
              //const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12.0, bottom: 10),
                child: Container(
                  height: 28,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Appcolor.aqua,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),

          // القلب باستخدام GetBuilder
          Positioned(
            top: 4,
            right: 4,
            child: GetBuilder<FavoriteController>(
              builder: (controller) {
                final isFav = controller.isFavorite(index);
                return GestureDetector(
                  onTap: () => controller.toggleFavorite(index),
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
