// import 'package:flutter/material.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/view/widget/detalis/counter.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart';

// class CartProductCard extends StatelessWidget {
//   final dynamic product;
//   const CartProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 500,
//       // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
//       padding: EdgeInsets.only(left: 57),
//       height: 140,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(10),
//           bottomRight: Radius.circular(10),
//         ),
//         boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
//       ),
//       child: Row(
//         children: [
//           // صورة
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 width: 78,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               Positioned(
//                 right: -30,
//                 child: Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                       image: AssetImage(product.Image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // تفاصيل
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       TitleOnly(title: product.title1),
//                       const Text(" / "),
//                       Flexible(
//                         child: Text(
//                           product.title2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text("${product.title3}",
//                       style: TextStyle(color: Appcolor.aqua, fontSize: 19)),
//                   const Counter(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/detalis/counter.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class CartProductCard extends StatelessWidget {
  final dynamic product;
  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 57.0),
      child: Container(
        width: 400,
        height: 140,
        //  padding: const EdgeInsets.only(right: 57),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            // صورة المنتج
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 78,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
//                                 right: -30,
                  right: -30,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(product.Image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // تفاصيل المنتج
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TitleOnly(title: product.title1),
                        const Text(" / "),
                        Flexible(
                          child: Text(
                            product.title2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${product.title3}",
                      style: TextStyle(
                        color: Appcolor.aqua,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Counter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
