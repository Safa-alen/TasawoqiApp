import 'package:get/get.dart';

class PaymentController extends GetxController {
  // الخيارات
  String selectedOption1 = ''; // 'home' أو 'office'
  String selectedOption2 = ''; // 'cash' أو 'app'

  // الملاحظات
  String homeNote = '';
  String officeNote = '';

  // تحديثات
  void selectOption1(String option) {
    selectedOption1 = option;
    update();
  }

  void selectOption2(String option) {
    selectedOption2 = option;
    update();
  }

  void updateHomeNote(String value) {
    homeNote = value;
    update();
  }

  void updateOfficeNote(String value) {
    officeNote = value;
    update();
  }

  // Getters لسهولة عرض البيانات
  String get address {
    if (selectedOption1 == 'home') {
      return homeNote.isNotEmpty ? homeNote : "المنزل";
    } else if (selectedOption1 == 'office') {
      return officeNote.isNotEmpty ? officeNote : "المكتب";
    }
    return "غير محدد";
  }

  String get paymentMethod {
    if (selectedOption2 == 'cash') return "عند الاستلام";
    if (selectedOption2 == 'app') return "التطبيق";
    return "غير محدد";
  }
}
