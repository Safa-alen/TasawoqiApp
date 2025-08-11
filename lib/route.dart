import 'package:get/route_manager.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/screen/auth/location.dart';
import 'package:tasawoqi/view/screen/auth/login.dart';
import 'package:tasawoqi/view/screen/auth/verfycode.dart';
import 'package:tasawoqi/view/screen/category/Personal_profile.dart';
import 'package:tasawoqi/view/screen/category/Stores_home.dart';
import 'package:tasawoqi/view/screen/category/ask_home.dart';
import 'package:tasawoqi/view/screen/category/category_home.dart';
import 'package:tasawoqi/view/screen/category/homepage.dart';
import 'package:tasawoqi/view/screen/category/offers_home.dart';

import 'view/screen/auth/singup.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => Homepage()),
  GetPage(name: AppRoute.Signup, page: () => Signup()),
  GetPage(name: AppRoute.Verfycode, page: () => Verfycode()),
  GetPage(name: AppRoute.Login, page: () => Login()),
  GetPage(name: AppRoute.Location, page: () => Location()),
  GetPage(name: AppRoute.Homepage, page: () => Homepage()),
  GetPage(name: AppRoute.StoresHome, page: () => StoresHome()),
  GetPage(name: AppRoute.OffersHome, page: () => OffersHome()),
  GetPage(name: AppRoute.personalPofileHome, page: () => PersonalProfile()),
  GetPage(name: AppRoute.askHome, page: () => AskHome()),
  GetPage(name: AppRoute.CatogeryHome, page: () => CategoryHome()),
];
