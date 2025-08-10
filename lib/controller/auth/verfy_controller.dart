import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';

abstract class VeryfircodeController extends GetxController {
  Veryfircode();
  GoToLocation();
}

class VeryfircodeControllerImp extends VeryfircodeController {
  late String Verfycode;
  @override
  GoToLocation() {
    Get.offAllNamed(AppRoute.Location);
  }

  @override
  Veryfircode() {}

  @override
  void onInit() {
    super.onInit();
  }
}
