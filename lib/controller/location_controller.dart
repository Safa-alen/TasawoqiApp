import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  LatLng? currentPosition;
  bool isLoading = true;
  String? error;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    isLoading = true;
    error = null;
    update(); // مهم لتحديث الواجهة

    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        currentPosition = LatLng(position.latitude, position.longitude);
      } else {
        error = "المستخدم رفض إذن الموقع ❌";
      }
    } catch (e) {
      error = "حدث خطأ: $e";
    }

    isLoading = false;
    update(); // تحديث الواجهة بعد الحصول على الموقع أو الخطأ
  }
}
