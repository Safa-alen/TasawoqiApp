import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
  String selectedSize = '';
  int selectedColorHex = 0;
  String selectedQuantity = '';

  void changeSize(String size) {
    selectedSize = size;
    update(); // حدث التغيير للـ GetBuilder
  }

  void changeColor(int color) {
    selectedColorHex = color;
    update();
  }

  void changeQuantity(String quantity) {
    selectedQuantity = quantity;
    update();
  }
}
