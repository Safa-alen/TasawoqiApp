import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List<int> favorites = [];

  void toggleFavorite(int index) {
    if (favorites.contains(index)) {
      favorites.remove(index);
    } else {
      favorites.add(index);
    }
    update(); // تحديث الواجهات
  }

  bool isFavorite(int index) {
    return favorites.contains(index);
  }
}
