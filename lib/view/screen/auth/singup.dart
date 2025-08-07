import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/core/function/validateput.dart';
import 'package:tasawoqi/view/widget/auth/auth_textfield.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';

import '../../widget/auth/authtext.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SignupcontrollerImp>(
      builder: (controller) => Column(
        children: [
          Form(key: controller.formstate, child: Center(child: Logoauth())),
          SizedBox(
            height: 40,
          ),
          AuthText(
            title: 'حساب جديد',
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          AuthText(
            title: ' الرجاء إدخال بياناتك للمتابعة',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 40,
          ),
          AuthTextfield(
              valid: (Value) {
                return ValidatInp(Value!, 5, 100, "usernama");
              },
              hinttext: "اسم المستخدم",
              mycontroller: controller.email,
              isNumber: false)
        ],
      ),
    ));
  }
}
