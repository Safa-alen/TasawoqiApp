import 'dart:io';
import 'package:flutter/material.dart';
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
// ✅ قائمة لكل TextEditingController لكل مقاس
  List<TextEditingController> sizeControllers = [];
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

  // void toggleSizes(bool value) {
  //   addSizes = value;
  //   update();
  // }

// ======= إدارة المقاسات ========
  // =============================
  void toggleSizes(bool value) {
    addSizes = value;
    if (addSizes && sizeControllers.isEmpty) {
      sizeControllers.add(TextEditingController());
    } else if (!addSizes) {
      // تنظيف المقاسات عند إغلاق السويتش
      for (var c in sizeControllers) {
        c.dispose();
      }
      sizeControllers.clear();
    }
    update();
  }

  void addSize() {
    sizeControllers.add(TextEditingController());
    update();
  }

  void removeSize(int index) {
    sizeControllers[index].dispose();
    sizeControllers.removeAt(index);
    update();
  }

  void setSizes(String value) {
    sizes = value;
    update();
  }
}
