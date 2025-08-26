import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ProductImageController extends GetxController {
  File? productImage;
  final ImagePicker _picker = ImagePicker();
//
  bool isSelected = false;
  // String? selectedUnit; // الافتراضي: لا شيء

  // void changeUnit(String unit) {
  //   selectedUnit = unit;
  //   update(); // يحدث كل GetBuilder اللي مربوط به
  // }

  void toggleSelection() {
    isSelected = !isSelected;
    update(); // إعادة بناء الواجهة
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      update();
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      update();
    }
  }
}
