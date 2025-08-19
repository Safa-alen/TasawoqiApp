import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/function/validateput.dart';
import 'package:tasawoqi/view/widget/auth/auth_textfield.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/person/ProfileI_mage_widget.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignupcontrollerImp>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0, left: 24),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            const Center(child: TitleOnly(title: "الملف الشخصي")),
            const SizedBox(height: 24),
            const ProfileImageWidget(),
            const SizedBox(height: 40),
            AuthTextfield(
              valid: (val) => ValidatInp(val!, 5, 100, "username"),
              hinttext: "الاسم الثلاثي",
              mycontroller: signupController.username,
              isNumber: false,
            ),
            const SizedBox(height: 16),
            AuthTextfield(
              valid: (val) => ValidatInp(val!, 5, 100, "phone"),
              hinttext: "رقم الموبايل",
              mycontroller: signupController.phone,
              isNumber: true,
            ),
            const SizedBox(height: 16),
            const TextfieldLocation(
              icon: AppImagess.icon1,
              hinttext: "المدينة",
            ),
            const SizedBox(height: 220),
            Buttom(
              text: "حفظ البيانات",
              onPressed: () {
                // هنا تضيفي حفظ البيانات
              },
            ),
          ],
        ),
      ),
    );
  }
}
