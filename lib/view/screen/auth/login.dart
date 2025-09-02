import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/login_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/function/validateput.dart';
import 'package:tasawoqi/view/widget/auth/auth_textfield.dart';
import 'package:tasawoqi/view/widget/auth/text_buttom.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';

import '../../widget/auth/authtext.dart';
import '../../widget/buttom.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LogincontrollerImp>();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Logoauth(),
          ),
        ),
        body: GetBuilder<LogincontrollerImp>(
          builder: (controller) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    AuthText(
                      title: 'تسجيل الدخول ',
                      style: Theme.of(context).textTheme.titleMedium!,
                    ),
                    AuthText(
                      title: ' الرجاء إدخال بياناتك للمتابعة',
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    const SizedBox(height: 40),
                    AuthTextfield(
                        valid: (Value) {
                          return ValidatInp(Value!, 5, 100, "Email");
                        },
                        hinttext: " البريد الالكتروني أو رقم الموبايل",
                        mycontroller: controller.email,
                        isNumber: false),
                    const SizedBox(height: 16),
                    GetBuilder<LogincontrollerImp>(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "نسيت كلمة المرور؟",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "تذكرني",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Checkbox(
                              focusColor: Appcolor.grey,
                              value: controller.remember,
                              onChanged: (bool? value) {},
                            ),
                          ],
                        )
                      ],
                    ),
                    Buttom(
                      text: 'تسجيل الدخول',
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset(AppImagess.google),
                    SizedBox(
                      height: 24,
                    ),
                    TextButtom(
                      text: "ليس لديك حساب؟ قم بإنشاء حساب جديد من ",
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
