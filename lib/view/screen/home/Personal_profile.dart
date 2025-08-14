import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/function/validateput.dart';
import 'package:tasawoqi/view/widget/auth/auth_textfield.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupcontrollerImp());

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 74),
          child: Column(children: [
            SizedBox(
              height: 24,
            ),
            Align(
                alignment: Alignment.center,
                child: TitleOnly(title: "الملف الشخصي")),
            SizedBox(
              height: 24,
            ),
            Container(
                height: 100,
                width: 100,
                child: GetBuilder<HomeScreenControllerImp>(
                  builder: (controller) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          controller.profileImage,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appcolor.white // لون خلفية الأيقونة
                                ),
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(
                                Icons.edit_outlined,
                                color: Appcolor.aqua,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(height: 40),
            AuthTextfield(
              valid: (val) => ValidatInp(val!, 5, 100, "username"),
              hinttext: "الاسم الثلاثي ",
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
            SizedBox(
              height: 1,
            ),
            TextfieldLocation(),
            SizedBox(
              height: 210,
            ),
            Buttom(text: "حفظ البيانات")
          ]),
        ));
  }
}
