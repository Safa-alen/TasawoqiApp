// import 'dart:io';
// import 'package:flutter/material.dart' show TextEditingController;
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ColorController extends GetxController {
//   final ImagePicker _picker = ImagePicker();
//   bool addColors = false;

//   // قائمة الألوان الأساسية
//   List<String> baseColors = ["أسود", "أبيض", "رمادي", "بيج"];

//   // حالة تفعيل كل لون
//   Map<String, bool> selectedColors = {};

//   // الألوان الجديدة التي يضيفها المستخدم
//   List<Map<String, dynamic>> newColors = [];
//   void toggleColors(bool value) {
//     addColors = value;
//     update();
//   }

//   ColorController() {
//     // افتراضي كل الألوان الأساسية غير مفعلة
//     for (var color in baseColors) {
//       selectedColors[color] = false;
//     }
//   }

//   // تفعيل أو تعطيل لون موجود
//   void toggleColorEnabled(String color) {
//     if (selectedColors.containsKey(color)) {
//       selectedColors[color] = !(selectedColors[color] ?? false);
//       update();
//     }
//   }

//   // إضافة لون جديد
//   void addNewColor(String name) {
//     newColors.add({
//       'name': name,
//       'image': null, // لاحقاً يمكن اختيار صورة
//       'isSelected': false,
//       'controller': TextEditingController(), // للتحكم بالنص إذا أردنا
//     });
//     update();
//   }

//   // حذف لون جديد
//   void removeNewColor(int index) {
//     if (index >= 0 && index < newColors.length) {
//       newColors.removeAt(index);
//       update();
//     }
//   }

//   // تفعيل أو تعطيل لون جديد
//   void toggleNewColorEnabled(int index) {
//     if (index >= 0 && index < newColors.length) {
//       newColors[index]['isSelected'] =
//           !(newColors[index]['isSelected'] ?? false);
//       update();
//     }
//   }

//   // اختيار صورة للون جديد
//   Future<void> pickColorImage(int index, {bool fromCamera = false}) async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: fromCamera ? ImageSource.camera : ImageSource.gallery,
//     );

//     if (pickedFile != null && index >= 0 && index < newColors.length) {
//       newColors[index]['image'] = File(pickedFile.path);
//       update();
//     }
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/Image_picker_helper_controller.dart';

class ColorController extends GetxController {
  bool addColors = false;

  // قائمة الألوان الأساسية
  List<String> baseColors = ["أسود", "أبيض", "رمادي", "بيج"];

  // حالة تفعيل كل لون
  Map<String, bool> selectedColors = {};

  // الألوان الجديدة التي يضيفها المستخدم
  List<Map<String, dynamic>> newColors = [];

  void toggleColors(bool value) {
    addColors = value;
    update();
  }

  ColorController() {
    for (var color in baseColors) {
      selectedColors[color] = false;
    }
  }

  void toggleColorEnabled(String color) {
    if (selectedColors.containsKey(color)) {
      selectedColors[color] = !(selectedColors[color] ?? false);
      update();
    }
  }

  void addNewColor(String name) {
    newColors.add({
      'name': name,
      'image': null,
      'isSelected': false,
      'controller': TextEditingController(),
    });
    update();
  }

  void removeNewColor(int index) {
    if (index >= 0 && index < newColors.length) {
      newColors.removeAt(index);
      update();
    }
  }

  void toggleNewColorEnabled(int index) {
    if (index >= 0 && index < newColors.length) {
      newColors[index]['isSelected'] =
          !(newColors[index]['isSelected'] ?? false);
      update();
    }
  }

  // صور كل لون أساسي
  Map<String, File?> baseColorImages = {};

  /// تعديل هذه الدالة لتستخدم الـ Helper
  Future<void> pickColorImage(int index) async {
    // استخدمي BottomSheet لاختيار المصدر مثل البروفايل
    final File? pickedFile = await ImagePickerHelper.pickImageWithSheet();
    if (pickedFile != null && index >= 0 && index < newColors.length) {
      newColors[index]['image'] = pickedFile;
      update();
    }
  }
}
