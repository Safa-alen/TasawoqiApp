import 'package:get/get.dart';

class CartController extends GetxController {
  var cartProducts = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> product) {
    cartProducts.add(product);
    update(); // لتحديث GetBuilder أيضاً
  }

  void removeFromCart(int index) {
    cartProducts.removeAt(index);
    update();
  }

  double get subtotal =>
      cartProducts.fold(0.0, (sum, item) => sum + item['title3']);
}
