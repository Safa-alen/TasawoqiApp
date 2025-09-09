import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/login_controller.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/controller/auth/verfy_controller.dart';
import 'package:tasawoqi/controller/home/Color_controller.dart';
import 'package:tasawoqi/controller/home/Personal_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/map_controller.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/controller/home/notification_controller.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/controller/home/search_controller.dart';
import 'package:tasawoqi/controller/onboarding_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // =======================
    // Controllers عامة للتطبيق
    // =======================

    Get.lazyPut(() => OnBordingControllerImp(), fenix: true);

    Get.lazyPut(() => SignupcontrollerImp(), fenix: true);
    Get.lazyPut(() => LogincontrollerImp(), fenix: true);
    Get.lazyPut(() => VeryfircodeControllerImp(), fenix: true);

    Get.lazyPut(() => HomeScreenControllerImp(), fenix: true);

    Get.lazyPut(() => ColorController(), fenix: true);

    // =======================
    // Controllers الخاص بالملف الشخصي
    // =======================
    Get.lazyPut(() => PersonalController(), fenix: true);

    // =======================
    // Controllers الخاص بالتاجر
    // =======================
    Get.lazyPut(() => MerchantImageController(), fenix: true);

    // =======================
    // Controllers الخاص بالطلبات
    // =======================
    Get.put(OrderController(), permanent: true);

    // =======================
    // Controllers الخاص بالمنتجات
    // =======================
    Get.put(ProductPanelController(), permanent: true);

    // =======================
    // Controllers الخاص بالبحث
    // =======================
    Get.put(SearchFilterController(), permanent: true);

    // =======================
    // Controllers الدفع
    // =======================
    Get.lazyPut(() => PaymentController(), fenix: true);

    Get.lazyPut<MapGetxController>(() => MapGetxController());
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
      fenix: true,
    );
  }
}
