// import 'package:flutter/material.dart';
// import 'package:tasawoqi/core/constant/color.dart';

// class categoryType extends StatelessWidget {
//   const categoryType({
//     super.key,
//     required this.images,
//     required this.titles1,
//     required this.titles2,
//     required this.titles3,
//   });
//   final List<String> images;
//   final List<String> titles1;
//   final List<String> titles2;
//   final List<String> titles3;
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: images.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisSpacing: 10, crossAxisCount: 2, mainAxisExtent: 250.0),
//       itemBuilder: (context, i) => Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.asset(
//                 images[i],
//                 height: 132,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Padding(
//                 padding: EdgeInsets.only(right: 9),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       //  overflow: TextOverflow.ellipsis,
//                       titles1[i],
//                       style: Theme.of(context).textTheme.bodySmall,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       titles2[i],
//                       maxLines: 1,
//                       // overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                     ),
//                     Text(
//                       titles3[i],
//                       maxLines: 1,
//                       // overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           fontFamily: 'Poppins',
//                           // fontWeight: FontWeight.normal,
//                           color: Appcolor.aqua),
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 12.0),
//               child: Container(
//                 height: 28,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: Appcolor.aqua,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: MaterialButton(
//                   onPressed: () {},
//                   child: Icon(
//                     Icons.add,
//                     color: Appcolor.white,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/favorite_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class CategoryTypeWidget extends StatelessWidget {
  const CategoryTypeWidget({
    super.key,
    required this.images,
    required this.titles1,
    required this.titles2,
    required this.titles3,
  });

  final List<String> images;
  final List<String> titles1;
  final List<String> titles2;
  final List<String> titles3;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisExtent: 270.0,
      ),
      itemBuilder: (context, i) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // صورة المنتج
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    images[i],
                    height: 132,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  // child: GetBuilder<FavoriteController>(
                  //   builder: (controller) => InkWell(
                  //     onTap: () {
                  //       controller.toggleFavorite(i);
                  //     },
                  child: Icon(
                    // controller.isFavorite(i)
                    // ? Icons.favorite
                    // :
                    Icons.favorite_border,
                    color: Appcolor.white,
                  ),
                ),

                // أيقونة القلب
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(right: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles1[i],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 5),
                  Text(
                    titles2[i],
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    titles3[i],
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontFamily: 'Poppins',
                          color: Appcolor.aqua,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Container(
                height: 28,
                width: 150,
                decoration: BoxDecoration(
                  color: Appcolor.aqua,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: Appcolor.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
