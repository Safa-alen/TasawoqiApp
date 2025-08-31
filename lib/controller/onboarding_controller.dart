import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/core/services/services.dart';
import 'package:tasawoqi/data/datasource/static/onboarding.dart';

abstract class OnBordingController extends GetxController {
  Naxt();
  OnPageChanged(int index);
}

class OnBordingControllerImp extends OnBordingController {
  PageController? pagecontroller;
  int currentpage = 0;
  MyServices services = Get.find();

  @override
  Naxt() {
    currentpage++;
    if (currentpage > onboardingList.length - 1) {
      services.sharedpreferences.setString('onboarding', "1");
      Get.offNamed(AppRoute.signup);
    } else {
      pagecontroller!.animateToPage(currentpage,
          duration: Duration(milliseconds: 900), curve: Curves.easeIn);
    }
  }

  @override
  OnPageChanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
