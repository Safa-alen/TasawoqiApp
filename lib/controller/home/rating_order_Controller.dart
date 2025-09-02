/////////////////التقيم/////////////////////
import 'package:get/get.dart';

class RatingController extends GetxController {
  int selectedStars = 0;

  void setStars(int count) {
    selectedStars = count;
    update(); // لتحديث الـ UI
  }

  void reset() {
    selectedStars = 0;
    update();
  }

  void submitRating(dynamic order) {
    // هنا ممكن تضيف منطق الحفظ أو الإرسال للـ backend
    print('تم تقييم الطلب ${order.number} بـ $selectedStars نجوم');
    reset();
    Get.back();
  }
}
