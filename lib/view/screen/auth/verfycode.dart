import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/auth/verfy_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/auth/authtext.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';
import 'package:tasawoqi/view/widget/buttom.dart';

class Verfycode extends StatelessWidget {
  const Verfycode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VeryfircodeControllerImp());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Logoauth()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 64,
              ),
              AuthText(
                title: "OTP",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              AuthText(
                title:
                    "الرجاء إدخال الرمز الذي قمنا بإرساله لك\n عبر البريد الالكتروني لتأكيد هويتك",
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              SizedBox(
                height: 51,
              ),
              OtpTextField(
                fieldWidth: 64,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                numberOfFields: 4,
                borderColor: Appcolor.aqua,

                showFieldAsBox: true,

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
              SizedBox(
                height: 113,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 56,
                  width: 312,
                  child: Buttom(
                    text: 'متابعة',
                    onPressed: () {
                      controller.GoToLocation();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
