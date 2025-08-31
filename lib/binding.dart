// import 'package:get/get.dart';

// import 'controller/auth/signup_controller.dart';

// class MyBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => SignupcontrollerImp(), fenix: true);
//   }
// }
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/controller/home/Color_controller.dart';
import 'package:tasawoqi/controller/home/Personal_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/controller/home/search_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Controllers عامة للتطبيق
    Get.lazyPut(() => SignupcontrollerImp(), fenix: true);
    Get.lazyPut(() => HomeScreenControllerImp(), fenix: true);

    // Controllers الخاص بالملف الشخصي
    Get.lazyPut(() => PersonalController(), fenix: true);

    // Controllers الخاص بالتاجر
    Get.lazyPut(() => MerchantImageController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.lazyPut(() => OrderController(), fenix: true);
    Get.put(ProductPanelController(), permanent: true);
    Get.put(SearchFilterController(), permanent: true);

    Get.lazyPut(() => ColorController(), fenix: true);
  }
}
