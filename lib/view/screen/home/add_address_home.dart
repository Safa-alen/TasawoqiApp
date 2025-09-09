import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/map_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class AddAddressHome extends StatelessWidget {
  AddAddressHome({super.key});

  final MapController flutterMapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TitleOnly(title: ' اضافة عنوان جديد'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24),
          child: ListView(
            children: [
              Container(
                width: 400,
                height: 200,
                child: GetBuilder<MapGetxController>(
                  builder: (mapController) => FlutterMap(
                    mapController: flutterMapController,
                    options: MapOptions(
                      initialCenter: mapController.currentMarker,
                      initialZoom: 13,
                      onTap: (tapPosition, point) {
                        mapController.updateMarker(point);
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.example.tasawoqi',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: mapController.currentMarker,
                            width: 80,
                            height: 80,
                            child: Icon(
                              Icons.location_on,
                              color: Appcolor.aqua,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextfieldLocation(hinttext: "اسم العنوان"),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "رقم الموبايل لهذا العنوان"),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "المدينة", icon: AppImagess.icon1),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "المنطقة"),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "الشارع او(او رقم البناء)"),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "الطابق"),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "قريب من"),
              const SizedBox(height: 16),
              TextfieldLocation(hinttext: "تفاصيل اكثر"),
              const SizedBox(height: 24),
              Buttom(
                text: "حفظ",
                onPressed: () {
                  final controller = Get.find<MapGetxController>();
                  final data = controller.getLocationData();

                  // مثلاً تطبعيها قبل الإرسال
                  print(
                      "Latitude: ${data['latitude']}, Longitude: ${data['longitude']}");
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
