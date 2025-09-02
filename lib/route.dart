import 'package:get/route_manager.dart';
import 'package:tasawoqi/core/constant/route.dart';

// Auth
import 'package:tasawoqi/view/screen/auth/login.dart';
import 'package:tasawoqi/view/screen/auth/singup.dart';
import 'package:tasawoqi/view/screen/auth/location.dart';
import 'package:tasawoqi/view/screen/auth/verfycode.dart';

// Onboarding
import 'package:tasawoqi/view/screen/onboarding.dart';

// Home Main Screens
import 'package:tasawoqi/view/screen/home/buttom_navi_bar.dart';
import 'package:tasawoqi/view/screen/home/homepage.dart';
import 'package:tasawoqi/view/screen/home/category_home.dart';
import 'package:tasawoqi/view/screen/home/category_type.dart';
import 'package:tasawoqi/view/screen/home/product_details.dart';
import 'package:tasawoqi/view/screen/home/offers_home.dart';
import 'package:tasawoqi/view/screen/home/notifications_home.dart';
import 'package:tasawoqi/view/screen/home/favorite_home.dart';
import 'package:tasawoqi/view/screen/home/payment_home.dart';
import 'package:tasawoqi/view/screen/home/cart_home.dart';
import 'package:tasawoqi/view/screen/home/tm_home.dart';

// Profile
import 'package:tasawoqi/view/screen/home/personal_profile.dart';
import 'package:tasawoqi/view/screen/home/merchant_profile.dart';

// Address
import 'package:tasawoqi/view/screen/home/address_home.dart';
import 'package:tasawoqi/view/screen/home/add_address_home.dart';

// Orders
import 'package:tasawoqi/view/screen/home/order_home.dart';
import 'package:tasawoqi/view/screen/home/order2_home.dart';
import 'package:tasawoqi/view/screen/home/orderpanel_home.dart';

// Panel (Admin / Merchant)
import 'package:tasawoqi/view/screen/home/control_panel_home.dart';
import 'package:tasawoqi/view/screen/home/productpanel_home.dart';
import 'package:tasawoqi/view/screen/home/balancepanel_home.dart';
import 'package:tasawoqi/view/screen/home/add_product_panel.dart';

// Stores
import 'package:tasawoqi/view/screen/home/storehome.dart';
import 'package:tasawoqi/view/screen/home/store_details.dart';

List<GetPage<dynamic>>? routes = [
  // Root
  GetPage(name: '/', page: () => ButtomNaviBar()),

  // ================= AUTH =================
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signup, page: () => Signup()),
  GetPage(name: AppRoute.verfycode, page: () => Verfycode()),
  GetPage(name: AppRoute.location, page: () => Location()),

  // ================= HOME =================
  GetPage(name: AppRoute.buttomNavBar, page: () => ButtomNaviBar()),
  GetPage(name: AppRoute.homepage, page: () => Homepage()),
  GetPage(name: AppRoute.catogeryHome, page: () => CategoryHome()),
  GetPage(
    name: AppRoute.catogerType,
    page: () => CategoryTypeHome(
      categoryId: Get.parameters['id'] ?? '',
      categoryTitle: Get.parameters['title'] ?? '',
    ),
  ),
  GetPage(name: AppRoute.productDetails, page: () => ProductDetails()),
  GetPage(name: AppRoute.offersHome, page: () => OffersHome()),
  GetPage(name: AppRoute.notificationsHome, page: () => NotificationsHome()),
  GetPage(name: AppRoute.favoriteHome, page: () => FavoritesHome()),
  GetPage(name: AppRoute.paymentHome, page: () => PaymentHome()),
  GetPage(name: AppRoute.cartHome, page: () => CartHome()),
  GetPage(name: AppRoute.tmHome, page: () => TmHome()),

  // ================= PROFILE =================
  GetPage(name: AppRoute.personalPofileHome, page: () => PersonalProfile()),
  GetPage(name: AppRoute.merchantProfile, page: () => MerchantProfile()),

  // ================= ADDRESS =================
  GetPage(name: AppRoute.addressHome, page: () => AddressHome()),
  GetPage(name: AppRoute.addAddressHome, page: () => AddAddressHome()),

  // ================= ORDERS =================
  GetPage(name: AppRoute.ordersHome, page: () => OrderHome()),
  GetPage(name: AppRoute.orderDetailsScreen, page: () => OrderDetailsScreen()),
  GetPage(name: AppRoute.orderpanelHome, page: () => OrderpanelHome()),

  // ================= PANEL =================
  GetPage(name: AppRoute.controlPanelHome, page: () => ControlPanelHome()),
  GetPage(name: AppRoute.productPanelHome, page: () => ProductPanelHome()),
  GetPage(name: AppRoute.balancepanelHome, page: () => BalancepanelHome()),
  GetPage(name: AppRoute.addProductPanel, page: () => AddProductPanel()),

  // ================= STORES =================
  GetPage(name: AppRoute.storesHome, page: () => StoresHome()),
  GetPage(name: AppRoute.storeDetails, page: () => StoreDetails()),
];
