import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tasawoqi/controller/onboarding_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/onboarding/custom_dot.dart';
import 'package:tasawoqi/view/widget/onboarding/custom_slider.dart';

import '../widget/onboarding/custom_buttom.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 184,
          ),
          Expanded(
            flex: 2,
            child: CustomSlider(),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDot(),
                  SizedBox(
                    height: 72,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 24),
                    child: Custom_Buttom(),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
