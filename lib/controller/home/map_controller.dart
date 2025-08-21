// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart';

// class MapGetxController extends GetxController {
//   LatLng currentMarker = LatLng(33.5138, 36.2765); // الموقع الافتراضي دمشق

//   void updateMarker(LatLng newPoint) {
//     currentMarker = newPoint;
//     update(); // يحدث GetBuilder
//   }
// }
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class MapGetxController extends GetxController {
  // الموقع الافتراضي (دمشق)
  LatLng currentMarker = LatLng(33.5138, 36.2765);

  // كنترولر للتكست فيلد
  TextEditingController locationController = TextEditingController();

  // قيم جاهزة للإرسال للباك
  double latitude = 33.5138;
  double longitude = 36.2765;

  @override
  void onInit() {
    super.onInit();
    locationController.text = "Lat: $latitude, Lng: $longitude"; // عرض مبدئي
  }

  void updateMarker(LatLng newPoint) {
    currentMarker = newPoint;

    // خزّن القيم
    latitude = newPoint.latitude;
    longitude = newPoint.longitude;

    // عرّضها بالنص (للمستخدم فقط)
    locationController.text =
        "Lat: ${newPoint.latitude}, Lng: ${newPoint.longitude}";

    update();
  }

  // دالة بسيطة تعطيك Map جاهز للإرسال للـ API
  Map<String, dynamic> getLocationData() {
    return {
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
