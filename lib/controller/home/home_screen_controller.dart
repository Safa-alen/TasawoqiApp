import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/view/screen/home/Personal_profile.dart';
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

  List<Widget Function()> get listpage => [
        () => Homepage(),
        () => OffersHome(),
        () => CartHome(),
        () => StoresHome(),
        () => isMerchant ? MerchantProfile() : PersonalProfile(),
      ];
  // تغيير الصفحة الحالية
  @override
  void changPage(int i) {
    currentpage = i;
    update();
  }

  // تغيير صورة البروفايل
  // @override
  // void changeProfileImage(String newPath) {
  //   profileImage = newPath;
  //   update();
  // }

  // إضافة منتج للسلة والانتقال لصفحة السلة
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
}
