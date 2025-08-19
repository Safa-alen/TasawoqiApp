import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class PersonalController extends GetxController {
  String profileImage = AppImagess.Logo;

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
