import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/Color_controller.dart';
import 'package:tasawoqi/controller/home/Image_picker_helper_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';

class SwitchColor extends StatelessWidget {
  SwitchColor({super.key});
  final ColorController controller = Get.find<ColorController>();

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
                  inactiveThumbColor: Appcolor.white,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // 🔹 خيارات الألوان الأساسية
            if (controller.addColors)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: colorOptions.map((option) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 85.0),
                        child: Row(
                          children: [
                            Text(
                              "   إضافة صورة  ",
                              style: TextStyle(color: Appcolor.lightGrey),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // BottomSheet لاختيار مصدر الصورة
                                final pickedFile = await ImagePickerHelper
                                    .pickImageWithSheet();
                                if (pickedFile != null) {
                                  controller.baseColorImages[option["name"]] =
                                      pickedFile;
                                  controller.update();
                                  Get.snackbar(
                                    "تم اختيار الصورة",
                                    "تم إضافة صورة للون الجديد",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        Colors.black.withOpacity(0.7),
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            option["name"],
                            style:
                                TextStyle(fontSize: 14, color: Appcolor.black),
                          ),
                          Checkbox(
                            value: controller.selectedColors[option["name"]] ??
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
              ),

            const SizedBox(height: 10),

            // زر إضافة لون جديد
            if (controller.addColors)
              TextButton(
                onPressed: () {
                  controller.addNewColor("");
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      " إضافة لون آخر  ",
                      style: TextStyle(
                        color:
                            controller.addColors ? Appcolor.aqua : Colors.grey,
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 22,
                      decoration: BoxDecoration(
                        color:
                            controller.addColors ? Appcolor.aqua : Colors.grey,
                        borderRadius: BorderRadius.circular(6),
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

            // ألوان جديدة يضيفها المستخدم
            ...controller.newColors.asMap().entries.map((entry) {
              int index = entry.key;
              var newColor = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextfieldLocation(
                    hinttext: 'اللون',
                    controller: newColor['controller'],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "   إضافة صورة  ",
                        style: TextStyle(color: Appcolor.lightGrey),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final pickedFile =
                              await ImagePickerHelper.pickImageWithSheet();
                          if (pickedFile != null) {
                            newColor['image'] = pickedFile;
                            controller.update();
                          }
                        },
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: Appcolor.switchcolor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
