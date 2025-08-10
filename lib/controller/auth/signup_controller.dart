import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';

abstract class SignupController extends GetxController {
  Signup();
}

class SignupcontrollerImp extends SignupController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;

  late TextEditingController phone;

  bool isshowpassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Signup() {
    if (formstate.currentState!.validate()) {
      Get.toNamed(AppRoute.Verfycode);
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
