import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeapp,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
