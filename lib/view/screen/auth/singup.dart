import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/core/function/validateput.dart';
import 'package:tasawoqi/view/widget/auth/auth_textfield.dart';
import 'package:tasawoqi/view/widget/auth/buttom_text.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';

import '../../widget/auth/authtext.dart';
import '../../widget/buttom.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupcontrollerImp());
    return Scaffold(
      body: GetBuilder<SignupcontrollerImp>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Logoauth()),
                  const SizedBox(height: 40),
                  AuthText(
                    title: 'حساب جديد',
                    style: Theme.of(context).textTheme.titleMedium!,
                  ),
                  AuthText(
                    title: ' الرجاء إدخال بياناتك للمتابعة',
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                  const SizedBox(height: 40),
                  AuthTextfield(
                    valid: (val) =>
                        ValidatInp(val!, 5, 100, "username"), // اسم المستخدم
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
                  GetBuilder<SignupcontrollerImp>(
                      builder: (controller) => AuthTextfield(
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
                          )),
                  Buttom(
                    text: 'متابعة',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(AppImagess.google),
                  SizedBox(
                    height: 24,
                  ),
                  TextButtom(
                    text: " إذا كان لديك حساب بالفعل قم بتسجيل الدخول من",
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.Login);
                      },
                      child: Text(
                        " هنا",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
