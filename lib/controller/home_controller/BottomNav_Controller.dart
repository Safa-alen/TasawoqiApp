import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> pages = [
    // HomeTab(),
    // ShopTab(),
    // LabelsTab(),
    // ProfileTab(),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    update(); // مهم جداً لإعلام الـ GetBuilder بالتحديث
  }
}
