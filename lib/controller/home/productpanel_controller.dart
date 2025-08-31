// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/Image_picker_helper_controller.dart'
//     show ImagePickerHelper;

// class ProductPanelController extends GetxController {
//   String selectedGender = ""; // فئة النوع المختار (نسائي، رجالي، إلخ)

//   File? productImage;
//   String? selectedOption;

//   bool isSelected = false;
//   bool showFilters = false;

//   String selectedUnit1 = ''; // وحدة القياس
//   String selectedUnit2 = ''; // العملة
//   String selectedUnit3 = ''; // نوع المنتج (نسائي / رجالي / ولادي / لاشيئ)

//   bool addDiscount = false;
//   String discount = "";

//   bool addSizes = false;
//   String sizes = "";

//   List<Map<String, dynamic>> addedProducts = [];
//   List<Map<String, dynamic>> allProducts = [];
//   List<Map<String, dynamic>> filteredProducts = [];

//   // قائمة خيارات البحث
//   final List<String> filters = ["نسائي", "رجالي", "ولادي", "لاشيئ"];

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
//     filterProductsByCategory(unit); // فلترة المنتجات مباشرة
//   }

//   // دالة فلترة المنتجات حسب الفئة

//   // void filterProductsByCategory(String category) {
//   //   if (category == "نسائي" || category == "رجالي" || category == "ولادي") {
//   //     filteredProducts =
//   //         allProducts.where((p) => p['gender'] == category).toList();
//   //   } else if (category == "لاشيئ") {
//   //     filteredProducts =
//   //         allProducts.where((p) => p['gender'] == "لاشيئ").toList();
//   //   }
//   //   update();
//   // }
// // دالة لتصفية المنتجات حسب الفئة
//   void filterProductsByCategory(String category) {
//     if (category.isEmpty) {
//       // إذا ما في فئة مختارة، عرض كل المنتجات
//       filteredProducts = addedProducts;
//     } else {
//       // عرض المنتجات اللي تتطابق مع الفئة المختارة
//       filteredProducts =
//           addedProducts.where((p) => p['gender'] == category).toList();
//     }
//     update();
//   }

// // دالة البحث
//   void filterOptions(String query) {
//     if (query.isEmpty) {
//       filteredProducts = addedProducts;
//     } else if (filters.contains(query)) {
//       filteredProducts =
//           addedProducts.where((p) => p['gender'] == query).toList();
//     } else {
//       filteredProducts = addedProducts
//           .where((item) =>
//               item['name'].toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     update();
//   }

//   void setShowFilters(bool value) {
//     showFilters = value;
//     if (value) {
//       selectedOption = null; // إعادة التعيين عند فتح الفلاتر
//     }
//     update();
//   }

// // دالة البحث والتصفية
//   // دالة البحث والتصفية
//   // void filterOptions(String query) {
//   //   if (query.isEmpty) {
//   //     // عرض جميع المنتجات عند البحث بدون نص
//   //     filteredProducts = allProducts;
//   //   } else if (filters.contains(query)) {
//   //     // ✅ إذا البحث يطابق أحد الفلاتر (نسائي، رجالي، ولادي، لاشيئ)
//   //     filteredProducts =
//   //         allProducts.where((p) => p['category'] == query).toList();
//   //   } else {
//   //     // ✅ بحث عادي بالاسم
//   //     filteredProducts = allProducts
//   //         .where((item) =>
//   //             item['name'].toLowerCase().contains(query.toLowerCase()))
//   //         .toList();
//   //   }
//   //   update();
//   // }

//   void selectOption(String option) {
//     if (option.isNotEmpty) {
//       selectedOption = option;
//       filterProductsByCategory(option); // تصفية المنتجات بناءً على الخيار
//       setShowFilters(false); // إغلاق الفلاتر بعد تحديد الفئة
//     }
//     update();
//   }

//   void selectGender(String gender) {
//     selectedGender = gender;
//     update(); // تحديث الواجهة عندما يتم اختيار فئة جديدة
//   }

//   // إضافة منتج

//   void addProduct({
//     required String name,
//     required String description,
//     required String price,
//     required File image,
//     // required String category,
//     required String gender, // ✅ لازم تنضاف
//   }) {
//     final newProduct = {
//       'name': name,
//       'description': description,
//       'price': price,
//       'image': image,
//       //  'category': category,
//       'gender': gender, // ✅ خزنيه
//       'isActive': true,
//     };
//     addedProducts.add(newProduct);
//     allProducts.add(newProduct);
//     filterProductsByCategory(selectedUnit3);
//     productImage = null;
//     isSelected = false;
//     selectedUnit1 = '';
//     selectedUnit2 = '';
//     selectedUnit3 = '';
//     selectedOption = null;
//     print('Product added successfully.');

//     update();
//   }

//   // حذف منتج
//   void removeProduct(int index) {
//     if (index >= 0 && index < addedProducts.length) {
//       final removed = addedProducts.removeAt(index);
//       allProducts.remove(removed);
//       filterProductsByCategory(selectedUnit3);
//       update();
//     }
//   }

//   // تعديل منتج
//   void editProduct(int index, Map<String, dynamic> updatedProduct) {
//     if (index >= 0 && index < addedProducts.length) {
//       final old = addedProducts[index];
//       allProducts.remove(old);

//       addedProducts[index] = updatedProduct;
//       allProducts.add(updatedProduct);
//       filterProductsByCategory(selectedUnit3);
//       update();
//     }
//   }

//   // اختيار صورة المنتج
//   Future<void> pickProductImage() async {
//     final File? pickedFile = await ImagePickerHelper.pickImageWithSheet();
//     if (pickedFile != null) {
//       productImage = pickedFile;
//       isSelected = true;
//       update();
//     }
//   }

//   void toggleDiscount(bool value) {
//     addDiscount = value;
//     update();
//   }

//   void setDiscount(String value) {
//     discount = value;
//     update();
//   }

//   void toggleSizes(bool value) {
//     addSizes = value;
//     update();
//   }

//   // تفعيل/تعطيل منتج
//   void toggleProductActive(int index, bool value) {
//     addedProducts[index]['isActive'] = value;
//     update();
//   }
// }
import 'dart:io';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/Image_picker_helper_controller.dart'
    show ImagePickerHelper;

class ProductPanelController extends GetxController {
  File? productImage;
  bool isSelected = false;

  String selectedUnit1 = ''; // وحدة القياس
  String selectedUnit2 = ''; // العملة
  String selectedUnit3 = ''; // الفئة (نسائي / رجالي / ولادي / لاشيئ)

  String selectedOption = '';
  bool showFilters = false;
  List<String> filters = ["نسائي", "رجالي", "ولادي", "لاشيئ"];

  bool addDiscount = false;
  String discount = "";

  bool addSizes = false;
  String sizes = "";

  List<Map<String, dynamic>> addedProducts = [];
  List<Map<String, dynamic>> filteredProducts = [];

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
    filterProductsByCategory(unit);
    update();
  }

  void setShowFilters(bool value) {
    showFilters = value;
    if (value) selectedOption = '';
    update();
  }

  void filterProductsByCategory(String? category) {
    if (category == null || category.isEmpty || category == 'لاشيئ') {
      filteredProducts = []; // فارغ → تعرض كل المنتجات
    } else {
      filteredProducts =
          addedProducts.where((p) => p['gender'] == category).toList();
    }
    update();
  }

// فلترة حسب البحث (يمكن البحث بالاسم أو الفئة)
  void filterOptions(String query) {
    if (query.isEmpty || query == 'لاشيئ') {
      filteredProducts = []; // إلغاء الفلترة
    } else if (["نسائي", "رجالي", "ولادي"].contains(query)) {
      filteredProducts =
          addedProducts.where((p) => p['gender'] == query).toList();
    } else {
      filteredProducts = addedProducts
          .where((p) => p['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  // void selectOption(String option) {
  //   selectedOption = option;
  //   filterProductsByCategory(option);
  //   setShowFilters(false);
  //   update();
  // }
  void selectOption(String option) {
    selectedOption = option;

    if (option == 'لاشيئ') {
      // عرض كل المنتجات
      filteredProducts = [];
    } else {
      // عرض المنتجات المطابقة فقط
      filteredProducts =
          addedProducts.where((p) => p['gender'] == option).toList();
    }

    setShowFilters(false);
    update();
  }

  void addProduct({
    required String name,
    required String description,
    required String price,
    required File image,
    required String gender,
  }) {
    final newProduct = {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'gender': gender,
      'isActive': true,
    };
    addedProducts.add(newProduct);

    // حدث الفلاتر بعد الإضافة
    //  filterProductsByCategory(selectedUnit3);

    // تنظيف الحقول المؤقتة فقط
    productImage = null;
    isSelected = false;
    selectedUnit1 = '';
    selectedUnit2 = '';

    print('Product added successfully.');
    update();
  }

  void editProduct(int index, Map<String, dynamic> updatedProduct) {
    if (index >= 0 && index < addedProducts.length) {
      addedProducts[index] = updatedProduct;
      filterProductsByCategory(selectedUnit3);
      update();
    }
  }

  void removeProduct(int index) {
    if (index >= 0 && index < addedProducts.length) {
      addedProducts.removeAt(index);
      filterProductsByCategory(selectedUnit3);
      update();
    }
  }

  Future<void> pickProductImage() async {
    final File? pickedFile = await ImagePickerHelper.pickImageWithSheet();
    if (pickedFile != null) {
      productImage = pickedFile;
      isSelected = true;
      update();
    }
  }

  void toggleProductActive(int index, bool value) {
    if (index >= 0 && index < addedProducts.length) {
      addedProducts[index]['isActive'] = value;
      update();
    }
  }

  void toggleDiscount(bool value) {
    addDiscount = value;
    update();
  }

  void setDiscount(String value) {
    discount = value;
    update();
  }

  void toggleSizes(bool value) {
    addSizes = value;
    update();
  }

  void setSizes(String value) {
    sizes = value;
    update();
  }
}
