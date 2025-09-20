import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/core/function/validateput.dart';
import 'package:tasawoqi/view/widget/auth/auth_textfield.dart';
import 'package:tasawoqi/view/widget/auth/text_buttom.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';

import '../../widget/auth/authtext.dart';
import '../../widget/buttom.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupcontrollerImp>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Logoauth(),
          ),
        ),
        body: GetBuilder<SignupcontrollerImp>(
          builder: (controller) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: AuthText(
                        title: ' حساب جديد',
                        style: Theme.of(context).textTheme.titleMedium!,
                      ),
                    ),
                    AuthText(
                      title: ' الرجاء إدخال بياناتك للمتابعة',
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    const SizedBox(height: 40),
                    AuthTextfield(
                      valid: (val) => ValidatInp(val!, 5, 100, "username"),
                      hinttext: "اسم المستخدم",
                      mycontroller: controller.username,
                      isNumber: false,
                    ),
                    const SizedBox(height: 16),
                    AuthTextfield(
                        valid: (Value) {
                          return ValidatInp(Value!, 5, 100, "phone");
                        },
                        hinttext: "رقم الموبايل",
                        mycontroller: controller.phone,
                        isNumber: true),
                    const SizedBox(height: 16),
                    AuthTextfield(
                        valid: (Value) {
                          return ValidatInp(Value!, 5, 100, "Email");
                        },
                        hinttext: "البريد الالكتروني ",
                        mycontroller: controller.email,
                        isNumber: false),
                    const SizedBox(height: 16),
                    AuthTextfield(
                      valid: (Value) {
                        return ValidatInp(Value!, 5, 30, "password");
                      },
                      hinttext: "كلمة المرور ",
                      obscuretext: controller.isshowpassword,
                      onTapIcon: () {
                        controller.showpassword();
                      },
                      isNumber: true,
                      mycontroller: controller.password,
                    ),
                    Buttom(
                      text: 'متابعة',
                      onPressed: () {
                        controller.Signup();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(AppImagess.google),
                    const SizedBox(
                      height: 24,
                    ),
                    TextButtom(
                      onTap: () {
                        Get.offNamed(AppRoute.login);
                      },
                      text: " إذا كان لديك حساب بالفعل قم بتسجيل الدخول من",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
