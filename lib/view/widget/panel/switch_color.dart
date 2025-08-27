import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/Color_controller.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class SwitchColor extends StatelessWidget {
  SwitchColor({super.key});
  final ColorController controller = Get.find<ColorController>();
  final TextEditingController colorController = TextEditingController();

  final List<Map<String, dynamic>> colorOptions = [
    {"name": "أسود", "color": Colors.black},
    {"name": "أبيض", "color": Colors.white},
    {"name": "رمادي", "color": Colors.grey},
    {"name": "بيج", "color": Color(0xFFF5F5DC)},
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ColorController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 🔹 السويتش
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "إضافة ألوان   ",
                  style: TextStyle(fontSize: 16, color: Appcolor.black),
                ),
                Switch(
                    value: controller.addColors,
                    onChanged: controller.toggleColors,
                    activeTrackColor: Appcolor.aqua,
                    inactiveThumbColor: Appcolor.white
                    // inactiveTrackColor: Color(0xFFD9D9D9),
                    ),
              ],
            ),

            const SizedBox(height: 10),

            // 🔹 خيارات الألوان
            if (controller.addColors)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...colorOptions.map((option) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // زر + لإضافة صورة
                        Padding(
                          padding: const EdgeInsets.only(left: 85.0),
                          child: Row(
                            //  crossAxisAlignment: CrossAxisAlignment.end,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "   إضافة صورة  ",
                                style: TextStyle(color: Appcolor.lightGrey),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Appcolor.switchcolor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),
                        Row(
                          children: [
                            Text(
                              option["name"],
                              style: TextStyle(fontSize: 14),
                            ),
                            Checkbox(
                              value:
                                  controller.selectedColors[option["name"]] ??
                                      false,
                              onChanged: (val) {
                                controller.toggleColorEnabled(option["name"]);
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  }).toList(),
                  // SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // اللوجيك تبع إضافة لون جديد
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // const SizedBox(
                        //     width: 8), // مسافة صغيرة بين المربع والنص
                        Text(
                          " إضافة لون آخر  ",
                          style: TextStyle(
                            color: controller.addColors
                                ? Appcolor.aqua
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 22,
                          decoration: BoxDecoration(
                            color: controller.addColors
                                ? Appcolor.aqua
                                : Colors.grey,
                            borderRadius:
                                BorderRadius.circular(6), // مربع مع زوايا خفيفة
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
