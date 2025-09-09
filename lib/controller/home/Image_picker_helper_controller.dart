// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImageWithSheet() async {
    File? pickedFile;

    await Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('الكاميرا'),
              onTap: () async {
                Get.back();
                final XFile? file =
                    await _picker.pickImage(source: ImageSource.camera);
                if (file != null) pickedFile = File(file.path);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('الاستوديو'),
              onTap: () async {
                Get.back();
                final XFile? file =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (file != null) pickedFile = File(file.path);
              },
            ),
          ],
        ),
      ),
    );

    return pickedFile;
  }
}
