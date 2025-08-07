// import 'package:applicationgetx/core/constant/route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/core/constant/route.dart';

// import '../../core/services/services.dart';

// abstract class LoginController extends GetxController {
//   login();
//   goToSignUp();
//   goToforgetpassword();
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
// }

// class LogincontrollerImp extends LoginController {
//   late TextEditingController email;
//   late TextEditingController password;

//   bool isshowpassword = true; //مخفية

//   showpassword() {
//     isshowpassword = isshowpassword == true ? false : true;
//     update();
//   }

//   @override
//   login() {
//     if (formstate.currentState!.validate()) {
//       print("Valid");
//     } else {
//       print("Not Valid");
//     }
//   }

//   @override
//   goToSignUp() {
//     Get.offNamed(AppRoute.SignUp);
//   }

//   @override
//   void onInit() {
//     email = TextEditingController();
//     password = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }

//   @override
//   goToforgetpassword() {
//     Get.toNamed(AppRoute.forgetPassword);
//   }
// }
