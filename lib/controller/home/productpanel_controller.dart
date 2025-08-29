import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasawoqi/controller/home/Image_picker_helper_controller.dart'
    show ImagePickerHelper;

// // class ProductPanelController extends GetxController {
// //   File? productImage;
// //   final ImagePicker _picker = ImagePicker();

// //   bool isSelected = false; // النص افتراضي رمادي
// //   String selectedUnit1 = ''; // وحدة القياس
// //   String selectedUnit2 = ''; // العملة
// //   String selectedUnit3 = ''; // نوع المنتج

// //   // سويتش الحسم
// //   bool addDiscount = false;
// //   String discount = "";

// //   // سويتش المقاسات
// //   bool addSizes = false;
// //   String sizes = "";

// //   // منتجات مضافة
// //   List<Map<String, dynamic>> addedProducts = [];

// //   // دالة لتغيير حالة الحسم
// //   void toggleDiscount(bool value) {
// //     addDiscount = value;
// //     update();
// //   }

// //   void setDiscount(String value) {
// //     discount = value;
// //     update();
// //   }

// //   // دوال اختيار الوحدة والعمله ونوع المنتج
// //   void selectUnit1(String unit) {
// //     selectedUnit1 = unit;
// //     update();
// //   }

// //   void selectUnit2(String unit) {
// //     selectedUnit2 = unit;
// //     update();
// //   }

// //   void selectUnit3(String unit) {
// //     selectedUnit3 = unit;
// //     update();
// //   }

// //   void toggleSizes(bool value) {
// //     addSizes = value;
// //     update();
// //   }

// //   // دوال اختيار الصورة
// //   Future<void> pickImageFromCamera() async {
// //     final XFile? pickedFile =
// //         await _picker.pickImage(source: ImageSource.camera);
// //     if (pickedFile != null) {
// //       productImage = File(pickedFile.path);
// //       isSelected = true;
// //       update();
// //     }
// //   }

// //   Future<void> pickImageFromGallery() async {
// //     final XFile? pickedFile =
// //         await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       productImage = File(pickedFile.path);
// //       isSelected = true;
// //       update();
// //     }
// //   }

// //   void toggleSelection() {
// //     isSelected = !isSelected;
// //     update();
// //   }

// //   // إضافة منتج
// //   void addProduct({
// //     required String name,
// //     required String description,
// //     required String price,
// //     required File image,
// //   }) {
// //     addedProducts.add({
// //       'name': name,
// //       'description': description,
// //       'price': price,
// //       'image': image,
// //     });
// //     update();
// //   }

// //   // حذف منتج
// //   void removeProduct(int index) {
// //     if (index >= 0 && index < addedProducts.length) {
// //       addedProducts.removeAt(index);
// //       update();
// //     }
// //   }

// //   // تعديل منتج
// //   void editProduct(int index, Map<String, dynamic> updatedProduct) {
// //     if (index >= 0 && index < addedProducts.length) {
// //       addedProducts[index] = updatedProduct;
// //       update();
// //     }
// //   }

// //   // تفعيل/تعطيل منتج
// //   void toggleProductActive(int index, bool value) {
// //     addedProducts[index]['isActive'] = value;
// //     update();
// //   }
// // }
// class ProductPanelController extends GetxController {
//   File? productImage;
//   bool isSelected = false; // النص افتراضي رمادي
//   String selectedUnit1 = ''; // وحدة القياس
//   String selectedUnit2 = ''; // العملة
//   String selectedUnit3 = ''; // نوع المنتج

//   // سويتش الحسم
//   bool addDiscount = false;
//   String discount = "";

//   // سويتش المقاسات
//   bool addSizes = false;
//   String sizes = "";

//   // منتجات مضافة
//   List<Map<String, dynamic>> addedProducts = [];

//   // دالة لتغيير حالة الحسم
//   void toggleDiscount(bool value) {
//     addDiscount = value;
//     update();
//   }

//   void setDiscount(String value) {
//     discount = value;
//     update();
//   }

//   // دوال اختيار الوحدة والعمله ونوع المنتج
//   void selectUnit1(String unit) {
//     selectedUnit1 = unit;
//     update();
//   }

//   void selectUnit2(String unit) {
//     selectedUnit2 = unit;
//     update();
//   }

//   void selectUnit3(String unit) {
//     selectedUnit3 = unit;
//     update();
//   }

//   void toggleSizes(bool value) {
//     addSizes = value;
//     update();
//   }

//   /// اختيار صورة المنتج (كاميرا أو معرض)
//   Future<void> pickImage({bool fromCamera = false}) async {
//     final File? picked =
//         await ImagePickerHelper.pickImage(fromCamera: fromCamera);
//     if (picked != null) {
//       productImage = picked;
//       isSelected = true;
//       update();
//     }
//   }

//   void toggleSelection() {
//     isSelected = !isSelected;
//     update();
//   }

//   // إضافة منتج
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
//     update();
//   }

//   // حذف منتج
//   void removeProduct(int index) {
//     if (index >= 0 && index < addedProducts.length) {
//       addedProducts.removeAt(index);
//       update();
//     }
//   }

//   // تعديل منتج
//   void editProduct(int index, Map<String, dynamic> updatedProduct) {
//     if (index >= 0 && index < addedProducts.length) {
//       addedProducts[index] = updatedProduct;
//       update();
//     }
//   }

//   // تفعيل/تعطيل منتج
//   void toggleProductActive(int index, bool value) {
//     addedProducts[index]['isActive'] = value;
//     update();
//   }
// }
class ProductPanelController extends GetxController {
  File? productImage;
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

  Future<void> pickProductImage() async {
    final File? pickedFile = await ImagePickerHelper.pickImageWithSheet();
    if (pickedFile != null) {
      productImage = pickedFile;
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
