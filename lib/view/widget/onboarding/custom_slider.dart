import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tasawoqi/controller/onboarding_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/data/datasource/static/onboarding.dart';

class CustomSlider extends GetView<OnBordingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (value) {
        controller.OnPageChanged(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Image.asset(onboardingList[index].image!),
          SizedBox(
            height: 104,
          ),
          Text(
            onboardingList[index].title!,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          SizedBox(
            height: 24,
          ),
          Text(onboardingList[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Appcolor.medigrey))
        ],
      ),
    );
  }
}
