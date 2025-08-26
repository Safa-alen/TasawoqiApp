// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class OrderController extends GetxController {
//   int selectedIndex = 1;

//   // بيانات الطلب
//   DateTime? orderDate;
//   int orderCounter = 0; // رقم تسلسلي يبدأ من 0
//   String orderNumber = ''; // رقم الطلب بصيغة 4 خانات
//   String address = ''; // العنوان
//   String payment = ''; // طريقة الدفع
//   double totalPrice = 0.0; // المبلغ الإجمالي

//   // تغيير التاب
//   void changeTab(int index) {
//     selectedIndex = index;
//     update();
//   }

//   // إنشاء طلب جديد
//   void createOrder(
//       {required String orderAddress,
//       required String orderPayment,
//       required double orderTotal}) {
//     orderDate = DateTime.now(); // وقت إنشاء الطلب
//     orderCounter++; // زيادة الرقم التسلسلي
//     orderNumber = orderCounter.toString().padLeft(4, '0'); // رقم الطلب 4 خانات

//     // حفظ البيانات القادمة من صفحة الدفع
//     address = orderAddress;
//     payment = orderPayment;
//     totalPrice = orderTotal;

//     update();
//   }
// }
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderController extends GetxController {
  int selectedIndex = 1;

  // بيانات الطلب
  DateTime? orderDate;
  int orderCounter = 0;
  String orderNumber = '';
  String address = '';
  String payment = '';
  double totalPrice = 0.0;

  // تغيير التاب
  void changeTab(int index) {
    selectedIndex = index;
    update();
  }

  // إنشاء طلب جديد وحفظ البيانات
  void createOrder({
    required String orderAddress,
    required String orderPayment,
    required double orderTotal,
  }) {
    orderDate = DateTime.now();
    orderCounter++;
    orderNumber = orderCounter.toString().padLeft(4, '0');

    address = orderAddress;
    payment = orderPayment;
    totalPrice = orderTotal;

    update();
  }
}
