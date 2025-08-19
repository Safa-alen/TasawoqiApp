import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart' show AppImagess;

Widget buildProfileImage() {
  return GetBuilder<MerchantController>(
    init: MerchantController(),
    builder: (controller) => Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: controller.profileImage == null
              ? Container(
                  height: 312,
                  width: 312,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.store, size: 100, color: Colors.grey),
                )
              : (controller.profileImage!.startsWith('assets/')
                  ? Image.asset(
                      controller.profileImage!,
                      height: 312,
                      width: 312,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(controller.profileImage!),
                      height: 312,
                      width: 312,
                      fit: BoxFit.cover,
                    )),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: InkWell(
            onTap: () {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('الكاميرا',
                            style: TextStyle(fontSize: 18)),
                        onTap: () {
                          controller.pickImageFromCamera();
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('الاستوديو',
                            style: TextStyle(fontSize: 18)),
                        onTap: () {
                          controller.pickImageFromGallery();
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(AppImagess.icon22, color: Appcolor.aqua),
            ),
          ),
        ),
      ],
    ),
  );
}
