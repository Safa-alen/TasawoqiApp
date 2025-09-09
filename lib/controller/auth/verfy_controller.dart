// import 'package:get/get.dart';
// import 'package:tasawoqi/core/constant/route.dart';

// abstract class VeryfircodeController extends GetxController {
//   Veryfircode();
//   GoToLocation();
// }

// class VeryfircodeControllerImp extends VeryfircodeController {
//   late String Verfycode;
//   @override
//   GoToLocation() {
//     Get.offAllNamed(AppRoute.location);
//   }

//   @override
//   Veryfircode() {}

//   @override
//   void onInit() {
//     super.onInit();
//   }
// }
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/core/services/api_service.dart' show ApiService;

abstract class VeryfircodeController extends GetxController {
  Veryfy(String code); // دالة للتحقق من الكود
  GoToLocation(); // دالة للانتقال للشاشة التالية
}

class VeryfircodeControllerImp extends VeryfircodeController {
  late String Verfycode; // لتخزين الكود المدخل
  final ApiService api = ApiService(); // استدعاء خدمة الـ API

  @override
  GoToLocation() {
    Get.offAllNamed(AppRoute.location); // انتقال دائم للشاشة
  }

  @override
  Veryfy(String code) async {
    Verfycode = code;

    try {
      // نفترض أن الباك يملك endpoint للتحقق من الكود
      final response = await api.verifyCode(Verfycode);

      if (response["success"] == true) {
        // الكود صحيح، انتقل للـ location
        GoToLocation();
      } else {
        // الكود غير صحيح
        Get.snackbar("خطأ", "كود التحقق غير صحيح");
      }
    } catch (e) {
      // أي خطأ أثناء الاتصال بالباك
      Get.snackbar("خطأ", "حدث خطأ أثناء التحقق: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
