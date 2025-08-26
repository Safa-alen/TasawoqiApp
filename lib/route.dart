import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/screen/auth/location.dart';
import 'package:tasawoqi/view/screen/auth/login.dart';
import 'package:tasawoqi/view/screen/auth/verfycode.dart';
import 'package:tasawoqi/view/screen/home/Personal_profile.dart';
import 'package:tasawoqi/view/screen/home/add_address_home.dart';
import 'package:tasawoqi/view/screen/home/add_product_panel.dart';
import 'package:tasawoqi/view/screen/home/address_home.dart';
import 'package:tasawoqi/view/screen/home/balancepanel_home.dart';
import 'package:tasawoqi/view/screen/home/control_panel_home.dart';
import 'package:tasawoqi/view/screen/home/favorite_home.dart';
import 'package:tasawoqi/view/screen/home/merchant_profile.dart';
import 'package:tasawoqi/view/screen/home/notifications_home.dart';
import 'package:tasawoqi/view/screen/home/offers_home.dart';
import 'package:tasawoqi/view/screen/home/buttom_navi_bar.dart';
import 'package:tasawoqi/view/screen/home/category_home.dart';
import 'package:tasawoqi/view/screen/home/category_type.dart';
import 'package:tasawoqi/view/screen/home/homepage.dart';
import 'package:tasawoqi/view/screen/home/order2_home.dart';
import 'package:tasawoqi/view/screen/home/order_home.dart';
import 'package:tasawoqi/view/screen/home/orderpanel_home.dart';
import 'package:tasawoqi/view/screen/home/payment_home.dart';
import 'package:tasawoqi/view/screen/home/productpanel_home.dart';
import 'package:tasawoqi/view/screen/home/product_details.dart';
import 'package:tasawoqi/view/screen/home/store_details.dart';
import 'package:tasawoqi/view/screen/home/storehome.dart';
import 'package:tasawoqi/view/screen/home/cart_home.dart';
import 'package:tasawoqi/view/screen/home/tm_home.dart';
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
  GetPage(name: AppRoute.productDetails, page: () => ProductDetails()),
  GetPage(name: AppRoute.favoriteHome, page: () => FavoritesHome()),
  GetPage(name: AppRoute.paymentHome, page: () => PaymentHome()),
  GetPage(name: AppRoute.tmHome, page: () => TmHome()),
  GetPage(name: AppRoute.addressHome, page: () => AddressHome()),
  GetPage(name: AppRoute.addAddressHome, page: () => AddAddressHome()),
  GetPage(name: AppRoute.notificationsHome, page: () => NotificationsHome()),

//panel controoler

  GetPage(name: AppRoute.controlPanelHome, page: () => ControlPanelHome()),
  GetPage(name: AppRoute.productPanelHome, page: () => ProductPanelHome()),
  GetPage(name: AppRoute.orderpanelHome, page: () => OrderpanelHome()),
  GetPage(name: AppRoute.balancepanelHome, page: () => BalancepanelHome()),
  GetPage(name: AppRoute.addProductPanel, page: () => AddProductPanel()),

  GetPage(name: AppRoute.ordersHome, page: () => OrderHome()),
  GetPage(name: AppRoute.orderDetailsScreen, page: () => OrderDetailsScreen()),
  GetPage(
    name: AppRoute.catogerType,
    page: () => CategoryTypeHome(
      categoryId: Get.parameters['id'] ?? '',
      categoryTitle: Get.parameters['title'] ?? '',
    ),
  ),
  GetPage(name: AppRoute.buttomNavBar, page: () => ButtomNaviBar()),
  GetPage(name: AppRoute.storesHome, page: () => StoresHome()),
  GetPage(name: AppRoute.storeDetails, page: () => StoreDetails()),
  GetPage(name: AppRoute.offersHome, page: () => OffersHome()),
  GetPage(name: AppRoute.personalPofileHome, page: () => PersonalProfile()),
  GetPage(name: AppRoute.merchantProfile, page: () => MerchantProfile()),
  GetPage(name: AppRoute.cartHome, page: () => CartHome()),
];
