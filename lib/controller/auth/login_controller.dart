import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/core/services/api_service.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
}

class LogincontrollerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true; //مخفية
  bool remember = false;

  final ApiService api = ApiService(); // استدعاء خدمة API

  // لتغيير حالة اظهار/اخفاء كلمة المرور

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  // لتغيير حالة تذكرني

  void setRememberMe(bool value) {
    remember = value;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      // استدعاء API لتسجيل الدخول
      // bool success = await api.login(email.text, password.text);

      // if (success) {
      //   // يمكن إضافة حفظ التوكن تلقائياً إذا remember=true
      //   Get.snackbar("نجاح", "تم تسجيل الدخول بنجاح");
      Get.offAllNamed(AppRoute.buttomNavBar); // الانتقال للشاشة الرئيسية
    } else {
      Get.snackbar("خطأ", "فشل تسجيل الدخول، تحقق من بياناتك");
    }
    //  }
    // else {
    //   print("Not Valid");
    // }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
