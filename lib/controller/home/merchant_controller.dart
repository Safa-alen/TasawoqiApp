import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class MerchantController extends GetxController {
  String profileImage = AppImagess.reco1; // صورة افتراضية
  final ImagePicker picker = ImagePicker();

  // اختيار صورة من الاستوديو
  Future<void> pickImageFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = image.path;
      update();
    }
  }

  // اختيار صورة من الكاميرا
  Future<void> pickImageFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      profileImage = image.path;
      update();
    }
  }
}
