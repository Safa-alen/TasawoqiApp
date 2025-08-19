import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tasawoqi/binding.dart';
import 'package:tasawoqi/controller/auth/signup_controller.dart'
    show SignupcontrollerImp;
import 'package:tasawoqi/controller/home/favorite_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/apptheme.dart';
import 'package:tasawoqi/core/services/services.dart';
import 'package:tasawoqi/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SignupcontrollerImp(), permanent: true);
  Get.put(HomeScreenControllerImp()); // <-- تأكدي من هذا السطر

  Get.put(FavoriteController()); // تسجيل الكونترولر لمرة وحدة

  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeapp,
      initialBinding: MyBinding(),
      getPages: routes,

      locale: const Locale('ar'), // لغة التطبيق الافتراضية: العربية
      supportedLocales: const [
        Locale('ar'), // العربية
        Locale('en'), // الإنجليزية لو حبيت تضيف دعم لغات ثانية
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
