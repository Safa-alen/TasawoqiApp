// import 'package:flutter/material.dart';
// import 'package:tasawoqi/data/datasource/static/offers.dart';
// import 'package:tasawoqi/view/widget/home/category_type_widget.dart';

// import 'package:tasawoqi/view/widget/home/search_home.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart';

// class OffersHome extends StatelessWidget {
//   OffersHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 2),
//       child: ListView(
//         children: [
//           const SizedBox(
//             height: 24,
//           ),
//           const Align(
//               alignment: Alignment.center, child: TitleOnly(title: "العروض")),
//           const SizedBox(
//             height: 24,
//           ),
//           const search_home(),
//           const SizedBox(
//             height: 24,
//           ),
//           GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               crossAxisCount: 2,
//               mainAxisExtent: 255.0,
//             ),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: Offers.length,
//             itemBuilder: (context, index) {
//               final offer = Offers[index]; // عنصر العرض الحالي

//               return InkWell(
//                 onTap: () {},
//                 child: CategoryTypeWidget(
//                   image: offer.imageo,
//                   title1: offer.title1o,
//                   title2: offer.title2o,
//                   title3: offer.title3o,
//                   index: index,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/offers_controller.dart';
import 'package:tasawoqi/view/widget/home/category_type_widget.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class OffersHome extends StatelessWidget {
  OffersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 2),
      child: GetBuilder<OffersController>(
        init: OffersController(), // نربط الكونترولر هون
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: [
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.center,
                child: TitleOnly(title: "العروض"),
              ),
              const SizedBox(height: 24),
              const search_home(),
              const SizedBox(height: 24),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: 255.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.offers.length,
                itemBuilder: (context, index) {
                  final offer = controller.offers[index];
                  return InkWell(
                    onTap: () {},
                    child: CategoryTypeWidget(
                      // offer: offer
                      image: offer.imageo,
                      title1: offer.title1o,
                      title2: offer.title2o,
                      title3: offer.title3o,
                      index: index,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
