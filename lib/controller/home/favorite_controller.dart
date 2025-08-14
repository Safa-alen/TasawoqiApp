// import 'package:get/get.dart';

// class FavoriteController extends GetxController {
//   List<Map<String, String>> favorites = [];

//   bool isFavorite(String image) {
//     return favorites.any((item) => item['image'] == image);
//   }

//   void toggleFavorite(
//       String image, String title1, String title2, String title3) {
//     if (isFavorite(image)) {
//       favorites.removeWhere((item) => item['image'] == image);
//     } else {
//       favorites.add({
//         'image': image,
//         'title1': title1,
//         'title2': title2,
//         'title3': title3,
//       });
//     }
//     update(); // هذا بيعمل إعادة بناء لـ GetBuilder
//   }
// }
