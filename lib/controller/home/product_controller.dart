import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
  String selectedSize = '';
  int selectedColorHex = 0;
  String selectedQuantity = '';
  int count = 1;
  String scheduleOption = ""; // "now" أو "datetime"
  String selectedInput = "";
  String selectedWeight = ""; // لتخزين الوزن أو القيمة المدخلة
  final inputController = TextEditingController();

  void setSelectedWeight(String value) {
    selectedWeight = value;
    update();
  }

  // دالة لتغيير الكمية وتصفير حقل الإدخال عند التغيير
  void changeQuantity(String q) {
    selectedQuantity = q;
    selectedInput = ""; // مسح القيمة السابقة عند تغيير الكمية
    inputController.clear(); // كل مرة تتغير الكمية، امسحي النص القديم

    update();
  }

  // إرجاع النص المناسب لحقل الإدخال حسب الكمية المختارة
  String getInputLabel() {
    if (selectedQuantity == "1") return "حدد كم كيلو غرام";
    if (selectedQuantity == "2") return "حدد كم غرام";
    if (selectedQuantity == "3") return "حدد بالـسعر";
    return "حدد الكمية";
  }

  void setSelectedInput(String value) {
    selectedInput = value;
    update();
  }

  void increment() {
    count++;
    update(); // لتحديث الواجهة
  }

  void decrement() {
    if (count > 1) {
      count--;
      update();
    }
  }

  void changeSize(String size) {
    selectedSize = size;
    update();
  }

  void changeColor(int color) {
    selectedColorHex = color;
    update();
  }

  void changeOption(String value) {
    // للجدولة
    scheduleOption = value;
    update();
  }
}
