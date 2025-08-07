import 'package:get/route_manager.dart';
import 'package:tasawoqi/controller/auth/verfy_code.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/screen/auth/login.dart';
import 'package:tasawoqi/view/screen/onboarding.dart';

import 'view/screen/auth/singup.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => Onboarding()),
  //GetPage(name: AppRoute.onboarding, page: () => Onboarding()),
  GetPage(name: AppRoute.Signup, page: () => Singup()),
  GetPage(name: AppRoute.verfyCode, page: () => VerfyCode()),
  GetPage(name: AppRoute.Login, page: () => Login()),
];
