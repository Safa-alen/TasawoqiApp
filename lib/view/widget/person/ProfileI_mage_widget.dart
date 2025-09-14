import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/Personal_controller.dart'
    show PersonalController;
import 'package:tasawoqi/core/constant/imagess.dart';

/// ويدجت خاصة بالصورة الشخصية
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<PersonalController>(
        init: PersonalController(),
        builder: (controller) => Stack(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(50),
            //   child: controller.fileImage != null
            //       ? Image.file(
            //           controller.fileImage!,
            //           height: 140,
            //           width: 140,
            //           fit: BoxFit.cover,
            //         )
            //       : Image.asset(
            //           controller.assetImage ?? AppImagess.Logo,
            //           height: 140,
            //           width: 140,
            //           fit: BoxFit.cover,
            //         ),
            // ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey[300], // خلفية رمادية
              backgroundImage: controller.profileImage != null
                  ? FileImage(File(controller.profileImage!))
                  : null,
              child: controller.profileImage == null
                  ? Icon(Icons.person, size: 70, color: Colors.white)
                  : null,
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Material(
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt_outlined,
                                  color: Colors.teal),
                              title: const Text("التقاط صورة بالكاميرا"),
                              onTap: () {
                                controller.pickFromCamera();
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_outlined,
                                  color: Colors.teal),
                              title: Text("اختيار من المعرض"),
                              onTap: () {
                                controller.pickFromGallery();
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
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      AppImagess.icon22,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
