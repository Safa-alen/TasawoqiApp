import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/core/services/api_service.dart';

abstract class SignupController extends GetxController {
  Signup();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
}

class SignupcontrollerImp extends SignupController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;

  late TextEditingController phone;

  bool isshowpassword = true;
  // GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final ApiService apiService = ApiService(); // ربطنا الـ API

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Signup()
  // async
  {
    if (formstate.currentState!.validate()) {
      // try {
      //   // جهز البيانات للإرسال
      //   final data = {
      //     "username": username.text.trim(),
      //     "email": email.text.trim(),
      //     "phone": phone.text.trim(),
      //     "password": password.text.trim(),
      //   };

      //   // نرسل البيانات للباك
      //   final response = await apiService.signup(data);

      //   // نفترض الباك بيرجع token و userId
      //   final token = response["token"];
      //   final userId = response["userId"];

      // if (token != null) {
      //   // التوكن يتم تخزينه أو استخدامه حسب الحاجة
      //   print("Signup successful, token: $token, userId: $userId");

      // نروح لشاشة التحقق من الكود
      // {
      Get.toNamed(
        AppRoute.location,
        //  arguments: {
        //   "email": email.text.trim(),
        //   "userId": userId,
        // }
      );
      //     } else {
      //       Get.snackbar("خطأ", "فشل التسجيل، حاول مرة أخرى");
      //     }
      //   } catch (e) {
      //     Get.snackbar("خطأ", e.toString());
      //   }
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    password.dispose();
    phone.dispose();

    super.dispose();
  }
}
