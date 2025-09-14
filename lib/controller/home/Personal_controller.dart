// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';

// class PersonalController extends GetxController {
//   String? assetImage = AppImagess.Logo; // صورة افتراضية من الـ assets
//   File? fileImage; // صورة مختارة من الجهاز

//   final ImagePicker _picker = ImagePicker();

//   // اختيار الصورة من المعرض
//   Future<void> pickFromGallery() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       fileImage = File(image.path);
//       assetImage = null; // نلغي الصورة الافتراضية
//       update();
//     }
//   }

//   // التقاط الصورة بالكاميرا
//   Future<void> pickFromCamera() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       fileImage = File(image.path);
//       assetImage = null; // نلغي الصورة الافتراضية
//       update();
//     }
//   }
// }
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalController extends GetxController {
  // بدل AppImagess.Logo نستخدم مسار فارغ كبداية
  String? profileImage;

  final ImagePicker _picker = ImagePicker();

  // اختيار الصورة من المعرض
  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = image.path;
      update();
    }
  }

  // التقاط الصورة بالكاميرا
  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      profileImage = image.path;
      update();
    }
  }
}
