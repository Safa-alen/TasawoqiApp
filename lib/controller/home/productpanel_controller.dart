// import 'dart:io';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:image_picker/image_picker.dart';

// class ProductPanelController extends GetxController {
//   File? productImage;
//   final ImagePicker _picker = ImagePicker();

//   bool isSelected = false; // النص افتراضي رمادي
//   String selectedUnit1 = ''; // القيمة الافتراضية فارغة وحدة القياس
//   String selectedUnit2 = ''; // القيمة الافتراضية فارغة  العملة
//   String selectedUnit3 = ''; // القيمة الافتراضية فارغة  نوع المنتج

//   // سويتش الحسم

//   bool addDiscount = false;
//   String discount = "";
//   // سويتش الألوان

//   bool addColors = false;
//   List<String> colors = ["أسود", "أبيض", "رمادي", "بيج"];
//   Map<String, String?> colorImages = {};
//   Map<String, bool> selectedColors = {}; // حالة تفعيل كل لون
//   // سويتش المقاسات

//   bool addSizes = false;
//   String sizes = "";

//   // ProductPanelController() {
//   //   // الافتراضي كل الألوان غير مفعلة
//   //   for (var color in colors) {
//   //     selectedColors[color] = false;
//   //   }
//   // }

//   void toggleDiscount(bool value) {
//     addDiscount = value;
//     update();
//   }

//   void setDiscount(String value) {
//     discount = value;
//     update();
//   }

//   // void toggleColors(bool value) {
//   //   addColors = value;
//   //   update();
//   // }

//   void toggleSizes(bool value) {
//     addSizes = value;
//     update();
//   }

//   void addColor(String color) {
//     colors.add(color);
//     selectedColors[color] = false; // جديد غير مفعل
//     update();
//   }

//   void setColorImage(String color, String imagePath) {
//     colorImages[color] = imagePath;
//     update();
//   }

//   void toggleColorEnabled(String color) {
//     selectedColors[color] = !(selectedColors[color] ?? false);
//     update();
//   }

//   void selectUnit3(String unit) {
//     //نوع المنتج
//     selectedUnit3 = unit;
//     update();
//   }

//   void selectUnit1(String unit) {
//     //وحدة القياس
//     selectedUnit1 = unit;
//     update();
//   }

//   void selectUnit2(String unit) {
//     // العملة
//     selectedUnit2 = unit;
//     update();
//   }

//   Future<void> pickImageFromCamera() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       productImage = File(pickedFile.path);
//       isSelected = true; // النص يصبح أخضر
//       update(); // إعادة بناء الواجهة
//     }
//   }

//   Future<void> pickImageFromGallery() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       productImage = File(pickedFile.path);
//       isSelected = true; // النص يصبح أخضر
//       update(); // إعادة بناء الواجهة
//     }
//   }

//   void toggleSelection() {
//     isSelected = !isSelected;
//     update(); // إعادة بناء الواجهة
//   }

//   List<Map<String, dynamic>> addedProducts = [];

//   // 🔹 دالة لإضافة منتج
//   void addProduct({
//     required String name,
//     required String description,
//     required String price,
//     required File image,
//   }) {
//     addedProducts.add({
//       'name': name,
//       'description': description,
//       'price': price,
//       'image': image,
//     });
//     update(); // تحديث GetBuilder
//   }

// //دالة الحذف
//   void removeProduct(int index) {
//     if (index >= 0 && index < addedProducts.length) {
//       addedProducts.removeAt(index);
//       update(); // إعادة بناء الواجهة
//     }
//   }

//   //دالة التعديل
//   void editProduct(int index, Map<String, dynamic> updatedProduct) {
//     if (index >= 0 && index < addedProducts.length) {
//       addedProducts[index] = updatedProduct;
//       update();
//     }
//   }

//   void toggleProductActive(int index, bool value) {
//     addedProducts[index]['isActive'] = value;
//     update(); // يحدث واجهة المستخدم
//   }
// }
import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ProductPanelController extends GetxController {
  File? productImage;
  final ImagePicker _picker = ImagePicker();

  bool isSelected = false; // النص افتراضي رمادي
  String selectedUnit1 = ''; // وحدة القياس
  String selectedUnit2 = ''; // العملة
  String selectedUnit3 = ''; // نوع المنتج

  // سويتش الحسم
  bool addDiscount = false;
  String discount = "";

  // سويتش المقاسات
  bool addSizes = false;
  String sizes = "";

  // منتجات مضافة
  List<Map<String, dynamic>> addedProducts = [];

  // دالة لتغيير حالة الحسم
  void toggleDiscount(bool value) {
    addDiscount = value;
    update();
  }

  void setDiscount(String value) {
    discount = value;
    update();
  }

  // دوال اختيار الوحدة والعمله ونوع المنتج
  void selectUnit1(String unit) {
    selectedUnit1 = unit;
    update();
  }

  void selectUnit2(String unit) {
    selectedUnit2 = unit;
    update();
  }

  void selectUnit3(String unit) {
    selectedUnit3 = unit;
    update();
  }

  void toggleSizes(bool value) {
    addSizes = value;
    update();
  }

  // دوال اختيار الصورة
  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      isSelected = true;
      update();
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      isSelected = true;
      update();
    }
  }

  void toggleSelection() {
    isSelected = !isSelected;
    update();
  }

  // إضافة منتج
  void addProduct({
    required String name,
    required String description,
    required String price,
    required File image,
  }) {
    addedProducts.add({
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    });
    update();
  }

  // حذف منتج
  void removeProduct(int index) {
    if (index >= 0 && index < addedProducts.length) {
      addedProducts.removeAt(index);
      update();
    }
  }

  // تعديل منتج
  void editProduct(int index, Map<String, dynamic> updatedProduct) {
    if (index >= 0 && index < addedProducts.length) {
      addedProducts[index] = updatedProduct;
      update();
    }
  }

  // تفعيل/تعطيل منتج
  void toggleProductActive(int index, bool value) {
    addedProducts[index]['isActive'] = value;
    update();
  }
}
