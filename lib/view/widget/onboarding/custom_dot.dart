import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tasawoqi/controller/onboarding_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

import '../../../data/datasource/static.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardingList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.only(right: 5),
                          duration: Duration(
                            microseconds: 900,
                          ),
                          width: controller.currentpage == index ? 20 : 13,
                          height: 4,
                          decoration: BoxDecoration(
                              color: controller.currentpage == index
                                  ? Appcolor.aqua
                                  : Appcolor.grey,
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            ));
  }
}
