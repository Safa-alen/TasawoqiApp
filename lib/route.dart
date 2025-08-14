import 'package:get/route_manager.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/screen/auth/location.dart';
import 'package:tasawoqi/view/screen/auth/login.dart';
import 'package:tasawoqi/view/screen/auth/verfycode.dart';
import 'package:tasawoqi/view/screen/home/Personal_profile.dart';
import 'package:tasawoqi/view/screen/home/favorite_home.dart';
import 'package:tasawoqi/view/screen/home/offers_home.dart';
import 'package:tasawoqi/view/screen/home/buttom_navi_bar.dart';
import 'package:tasawoqi/view/screen/home/category_home.dart';
import 'package:tasawoqi/view/screen/home/category_type.dart';
import 'package:tasawoqi/view/screen/home/homepage.dart';
import 'package:tasawoqi/view/screen/home/storehome.dart';
import 'package:tasawoqi/view/screen/home/order_home.dart';
import 'package:tasawoqi/view/screen/onboarding.dart';

import 'view/screen/auth/singup.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => ButtomNaviBar()),
  GetPage(name: AppRoute.signup, page: () => Signup()),
  GetPage(name: AppRoute.verfycode, page: () => Verfycode()),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.location, page: () => Location()),
  GetPage(name: AppRoute.catogeryHome, page: () => CategoryHome()),
  GetPage(name: AppRoute.homepage, page: () => Homepage()),
  //GetPage(name: AppRoute.favoriteHome, page: () => FavoritesHome()),
  GetPage(
    name: AppRoute.catogerType,
    page: () => CategoryTypeHome(
      categoryId: Get.parameters['id'] ?? '',
      categoryTitle: Get.parameters['title'] ?? '',
    ),
  ),
  GetPage(name: AppRoute.buttomNavBar, page: () => ButtomNaviBar()),
  GetPage(name: AppRoute.storesHome, page: () => StoresHome()),
  GetPage(name: AppRoute.offersHome, page: () => OffersHome()),
  GetPage(name: AppRoute.personalPofileHome, page: () => PersonalProfile()),
  GetPage(name: AppRoute.orderHome, page: () => OrderHome()),
];
