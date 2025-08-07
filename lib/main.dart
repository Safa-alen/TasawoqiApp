import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/onboarding_controller.dart';
import 'package:tasawoqi/core/constant/apptheme.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/services/services.dart';
import 'package:tasawoqi/route.dart';
import 'package:tasawoqi/view/screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Locacontroller controller = Get.put(Locacontroller());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeapp,
      getPages: routes,
    );
  }
}
