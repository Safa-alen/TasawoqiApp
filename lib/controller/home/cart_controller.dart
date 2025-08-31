// // }
// import 'package:get/get.dart';
// import 'package:tasawoqi/data/model/category_modle.dart';

// class CartController extends GetxController {
//   var cartProducts = <ObjctModle>[].obs;

//   void addToCart(ObjctModle product) {
//     cartProducts.add(product);
//     update(); // تحديث الواجهة
//   }

//   void removeFromCart(int index) {
//     cartProducts.removeAt(index);
//     update();
//   }

//   double get subtotal => cartProducts.fold(0.0, (sum, item) {
//         // إذا title3 نص، نحوله لرقم
//         final price = double.tryParse(item.title3.toString()) ?? 0.0;
//         return sum + price;
//       });
// }
import 'package:get/get.dart';
import 'package:tasawoqi/data/model/category_modle.dart';

class CartController extends GetxController {
  var cartProducts = <ObjctModle>[].obs;

  void addToCart(ObjctModle product) {
    cartProducts.add(product);
    update(); // لتحديث GetBuilder إذا استخدمت
  }

  void removeFromCart(int index) {
    cartProducts.removeAt(index);
    update();
  }

  double get subtotal =>
      cartProducts.fold(0.0, (sum, item) => sum + item.title3.toDouble());
}
