import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:tasawoqi/controller/location_controller.dart';

class AddAddressHome extends StatelessWidget {
  AddAddressHome({Key? key}) : super(key: key);

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text("خريطة المشتريات")),
        body: GetBuilder<LocationController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.error!),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.getLocation,
                      child: const Text("إعادة المحاولة"),
                    ),
                  ],
                ),
              );
            } else {
              return FlutterMap(
                options: MapOptions(
                  center: controller.currentPosition!,
                  zoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: "com.example.tasawoqi",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: controller.currentPosition!,
                        width: 80,
                        height: 80,
                        builder: (context) => const Icon(
                          Icons.my_location,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
