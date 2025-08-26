// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/data/datasource/categoy.dart';
// import 'package:tasawoqi/data/model/category_modle.dart';
// import 'package:tasawoqi/data/model/recomm_stores_modle.dart';
// import 'package:tasawoqi/view/widget/home/category_type_widget.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart'; // تأكد مسار المودل

// class StoreDetails extends StatelessWidget {
//   const StoreDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final store = Get.arguments as RecommstoresModle;

//     return Scaffold(
//       appBar: AppBar(
//         title: Align(
//             alignment: Alignment.centerRight,
//             child: TitleOnly(title: store.title3)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(right: 24.0, left: 24),
//         child: ListView(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 store.image,
//                 width: double.infinity,
//                 height: 312,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Icon(Icons.location_on, color: Appcolor.grey, size: 20),
//                 const SizedBox(width: 8),
//                 Text(
//                   store.address,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.access_time, color: Appcolor.grey, size: 20),
//                 const SizedBox(width: 8),
//                 Text(
//                   store.workinghours,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               store.title4,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodySmall!
//                   .copyWith(color: Appcolor.blacktext, fontSize: 14),
//             ),
//             const SizedBox(height: 40),
//             Text(
//               "منتجات المتجر",
//               style: TextStyle(color: Appcolor.black, fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: store.products.length,
//               itemBuilder: (context, index) {
//                 final product = store.products[index];
//                 return CategoryTypeWidget(
//                   index: index,
//                   image: product.image,
//                   title1: product.title1,
//                   title2: product.title2,
//                   title3: product.title3,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/data/model/recomm_stores_modle.dart';
import 'package:tasawoqi/view/widget/home/category_type_widget.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.arguments as RecommstoresModle;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TitleOnly(title: store.title3),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  store.image,
                  width: double.infinity,
                  height: 312,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(store.address,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(width: 8),
                  Icon(Icons.location_on, color: Appcolor.grey, size: 20),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(store.workinghours,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(width: 8),
                  Icon(Icons.access_time, color: Appcolor.grey, size: 20),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                store.title4,
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Appcolor.blacktext, fontSize: 14),
              ),
              const SizedBox(height: 40),
              Text("منتجات المتجر",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Appcolor.black, fontSize: 16)),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemCount: store.products.length,
                itemBuilder: (context, index) {
                  final product = store.products[index];
                  return CategoryTypeWidget(
                    index: index,
                    image: product.image,
                    title1: product.title1,
                    title2: product.title2,
                    title3: product.title3,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
