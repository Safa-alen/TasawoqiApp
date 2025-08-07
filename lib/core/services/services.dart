import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedpreferences;
  Future<MyServices> init() async {
    sharedpreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
