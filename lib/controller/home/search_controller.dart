// import 'package:get/get.dart';

// class SearchFilterController extends GetxController {
//   String? selectedOption; // خيار واحد بس
//   bool showFilters = false;

//   final List<String> filters = [
//     "متاجر",
//     "عروض",
//     "منتجات",
//     "نسائي",
//     "رجالي",
//     "ولادي",
//   ];

//   void setShowFilters(bool value) {
//     showFilters = value;
//     update();
//   }

//   void selectOption(String option) {
//     selectedOption = option;
//     update();

//     // التنقل حسب الخيار
//     switch (option) {
//       case "متاجر":
//         // Get.to(StoresPage());
//         break;
//       case "عروض":
//         // Get.to(OffersPage());
//         break;
//       case "منتجات":
//         // Get.to(ProductsPage());
//         break;
//       case "نسائي":
//         // Get.to(WomenPage());
//         break;
//       case "رجالي":
//         // Get.to(MenPage());
//         break;
//       case "ولادي":
//         // Get.to(KidsPage());
//         break;
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/route.dart';

class SearchFilterController extends GetxController {
  final controller = Get.find<HomeScreenControllerImp>(); // ✅

  String? selectedOption; // خيار واحد بس
  bool showFilters = false;

  final List<String> filters = [
    "متاجر",
    "عروض",
    "منتجات",
    "نسائي",
    "رجالي",
    "ولادي",
  ];

  List<String> filteredFilters = []; // اللستة اللي رح تنعرض

  SearchFilterController() {
    filteredFilters = filters; // بالبداية بتكون نفس الفلاتر كلها
  }

  // void setShowFilters(bool value) {
  //   showFilters = value;
  //   update();
  // }
  void setShowFilters(bool value) {
    showFilters = value;
    if (value) {
      // لما تظهر الفلاتر، نعيد تعيين الاختيار السابق
      selectedOption = null;
    }
    update();
  }

  void selectOption(String option) {
    selectedOption = option;
    update();

    final homeCtrl = Get.find<HomeScreenControllerImp>();

    // التنقل حسب الخيار
    switch (option) {
      case "متاجر":
        homeCtrl.changPage(3);

        break;
      case "عروض":
        homeCtrl.changPage(1);
        break;
      case "منتجات":
        Get.toNamed(AppRoute.productPanelHome);

        break;
      case "نسائي":
        // Get.to(WomenPage());
        break;
      case "رجالي":
        // Get.to(MenPage());
        break;
      case "ولادي":
        // Get.to(KidsPage());
        break;
    }
    setShowFilters(false); // إخفاء الخيارات بعد ما يختار
  }

  /// 🔎 فلترة حسب النص المدخل
  void filterOptions(String query) {
    if (query.isEmpty) {
      filteredFilters = filters; // إذا فاضي رجّع الكل
    } else {
      filteredFilters = filters
          .where((item) => item.startsWith(query)) // يطابق من البداية
          .toList();
    }
    update();
  }
}
