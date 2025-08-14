// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/favorite_controller.dart';

// class FavoritesPage extends StatelessWidget {
//   final FavoriteController controller = Get.find<FavoriteController>();

//   FavoritesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("المفضلة"),
//         centerTitle: true,
//       ),
//       body: GetBuilder<FavoriteController>(
//         builder: (controller) {
//           if (controller.favorites.isEmpty) {
//             return Center(
//               child: Text("لا توجد عناصر في المفضلة"),
//             );
//           }

//           return ListView.builder(
//             itemCount: controller.favorites.length,
//             itemBuilder: (context, index) {
//               final item = controller.favorites[index];

//               return ListTile(
//                 leading: Image.asset(
//                   item['image'] ??
//                       'assets/images/placeholder.png', // صورة افتراضية
//                   width: 50,
//                   height: 50,
//                 ),
//                 title: Text(item['title1'] ?? ""),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(item['title2'] ?? ""),
//                     Text(item['title3'] ?? "",
//                         style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     controller.toggleFavorite(
//                       item['image'] ?? "",
//                       item['title1'] ?? "",
//                       item['title2'] ?? "",
//                       item['title3'] ?? "",
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
