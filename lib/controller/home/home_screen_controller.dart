import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/view/screen/home/Personal_profile.dart';
import 'package:tasawoqi/view/screen/home/control_panel_home.dart';
import 'package:tasawoqi/view/screen/home/homepage.dart';
import 'package:tasawoqi/view/screen/home/merchant_profile.dart';
import 'package:tasawoqi/view/screen/home/storehome.dart';
import '../../view/screen/home/cart_home.dart';
import '../../view/screen/home/offers_home.dart';

abstract class HomeScreenController extends GetxController {
  void changPage(int i);
//  void changeProfileImage(String newPath);
  void addProductToCart(ObjctModle product);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  //String profileImage = AppImagess.personal;
  bool isMerchant = true; // إذا كان المستخدم تاجر

  // قائمة المنتجات في السلة
  List<ObjctModle> cartProducts = [];
  double lastTotalPrice = 0.0;
  String lastAddress = "غير محدد";
  String lastPayment = "غير محدد";
  void saveLastOrder({
    required double totalPrice,
    required String address,
    required String payment,
  }) {
    lastTotalPrice = totalPrice;
    lastAddress = address;
    lastPayment = payment;
  }

  void handleSearchOption(String option) {
    if (option == "عروض") {
      changPage(1);
    } else if (option == "متاجر") {
      changPage(3);
    }
    // باقي الخيارات يمكن التعامل معها لاحقًا
  }

  List<Widget Function()> get listpage => [
        () => Homepage(),
        () => OffersHome(),
        () => CartHome(),
        () => StoresHome(),
        () => isMerchant ? MerchantProfile() : PersonalProfile(),
        () => ControlPanelHome(),
      ];
  // تغيير الصفحة الحالية
  @override
  void changPage(int i) {
    currentpage = i;
    update();
  }

  @override
  void addProductToCart(ObjctModle product) {
    // تحقق إذا المنتج موجود مسبقاً
    bool alreadyInCart = cartProducts.any((p) => p.id == product.id);
    if (!alreadyInCart) {
      cartProducts.add(product); // أضف المنتج
    }
    //currentpage = 2; // انتقل للسلة
    update();
  }

  List<ObjctModle> products = [];

  // محاكاة جلب البيانات من الباك
  Future<void> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate API
    products = [
      ObjctModle(
        id: "29",
        title1: 'عصير ايكرفون',
        title2: 'عصائر الملك',
        title3: 60,
        Image: AppImagess.drink1,
        title4: 'لوريم ابسوم ...',
        point: '5 نقاط',
      ),
      // ضيفي منتجات تانية من الباك أو Firebase
    ];
    update(); // 🔥 تحدّث الـ UI
  }
}
