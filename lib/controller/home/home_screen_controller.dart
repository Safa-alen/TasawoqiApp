import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tasawoqi/view/screen/home/Personal_profile.dart';
import 'package:tasawoqi/view/screen/home/Stores_home.dart';
import 'package:tasawoqi/view/screen/home/homepage.dart';
import 'package:tasawoqi/view/screen/home/offers_home.dart';
import 'package:tasawoqi/view/screen/home/order_home.dart';

abstract class HomeScreenController extends GetxController {
  changPage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    Homepage(),
    OffersHome(),
    OrderHome(),
    StoresHome(),
    PersonalProfile()
  ];
  @override
  changPage(int i) {
    currentpage = i;
    update();
  }
}
