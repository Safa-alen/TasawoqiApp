import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tasawoqi/binding.dart';
import 'package:tasawoqi/core/constant/apptheme.dart';
import 'package:tasawoqi/core/services/services.dart';
import 'package:tasawoqi/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      initialBinding: MyBinding(), // ✅ هاد بيربط الكنترولرز كلها
      getPages: routes,
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
