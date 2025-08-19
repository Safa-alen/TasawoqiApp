// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/controller/home/timerange_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/screen/home/buttom_navi_bar.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/merchant/build_header.dart';
import 'package:tasawoqi/view/widget/merchant/build_profileImage.dart';
import 'package:tasawoqi/view/widget/merchant/build_time_rangepcker.dart';

class MerchantProfile extends GetView<MerchantController> {
  const MerchantProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenControllerImp>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context, homeController),
            const SizedBox(height: 24),
            buildProfileImage(),
            const SizedBox(height: 24),
            const TextfieldLocation(hinttext: "اسم المتجر"),
            const SizedBox(height: 16),
            const TextfieldLocation(hinttext: "العنوان"),
            const SizedBox(height: 16),
            TextfieldLocation(
              onTap: () {},
              hinttext: "المدينة",
              icon: AppImagess.icon1,
            ),
            const SizedBox(height: 16),
            Text("اوقات الدوام", style: TextStyle(color: Appcolor.blacklight)),
            const SizedBox(height: 6),
            buildTimeRangePicker(),
            const SizedBox(height: 25),
            Buttom(text: "حفظ البيانات"),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
