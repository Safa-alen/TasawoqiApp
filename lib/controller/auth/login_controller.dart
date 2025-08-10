import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';

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
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  void setRememberMe(bool value) {
    remember = value;
    update();
  }

  @override
  login() {
    if (formstate.currentState!.validate()) {
      Get.toNamed(AppRoute.Location);
      print("Valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignUp() {}

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
