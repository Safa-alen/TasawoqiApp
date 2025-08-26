// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';

// class MerchantController extends GetxController {
//   String profileImage = AppImagess.reco1; // صورة افتراضية
//   final ImagePicker picker = ImagePicker();

//   // اختيار صورة من الاستوديو
//   Future<void> pickImageFromGallery() async {
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       profileImage = image.path;
//       update();
//     }
//   }

//   // اختيار صورة من الكاميرا
//   Future<void> pickImageFromCamera() async {
//     final XFile? image = await picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       profileImage = image.path;
//       update();
//     }
//   }
// }
import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart'
    show GetxController;
import 'package:image_picker/image_picker.dart';

class MerchantImageController extends GetxController {
  File? profileImage;
  final ImagePicker _picker = ImagePicker();
  bool _isPicking = false;

  Future<void> pickImage(ImageSource source) async {
    if (_isPicking) return;
    _isPicking = true;
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        update();
      }
    } finally {
      _isPicking = false;
    }
  }
}
