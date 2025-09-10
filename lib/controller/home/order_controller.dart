// }

import 'package:get/get.dart';

class Order {
  final String number;
  final DateTime date;
  final String address; //منزل او مكتب
  final String payment; //تطبيق او عند الاستلام
  final double totalPrice;
  final double subtotal;
  final double shipping;
  final double discount;
  final List<Map<String, dynamic>>
      products; // قائمة المنتجات (صورة + عناوين + سعر)

  String status; // قيد التحضير، قيد التوصيل، تم الارسال

  Order({
    required this.number,
    required this.date,
    required this.address,
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.payment,
    required this.totalPrice,
    required this.products,
    this.status = 'قيد التحضير ', // الحالة الافتراضية
  });
}

class OrderController extends GetxController {
  int selectedIndex = 1; // 0 = السابقة, 1 = الحالية

  // قائمة الطلبات
  final List<Order> orders = [];

  // تغيير التاب
  void changeTab(int index) {
    selectedIndex = index;
    update();
  }

  // إنشاء طلب جديد
  void createOrder({
    required String orderAddress,
    required String orderPayment,
    required double orderTotal,
    required double subtotal,
    required double shipping,
    required double discount,
    required List<Map<String, dynamic>> products, // ⚡ إضافة هذا
  }) {
    final orderNumber = DateTime.now()
        .millisecondsSinceEpoch
        .remainder(10000)
        .toString()
        .padLeft(4, '0');

    final newOrder = Order(
      subtotal: subtotal,
      shipping: shipping,
      discount: discount,

      number: orderNumber,
      date: DateTime.now(),
      address: orderAddress,
      payment: orderPayment,
      totalPrice: orderTotal,
      products: products, // ⚡ تمرير المنتجات هنا

      //   status: 'تم الاستلام ',
      status: 'قيد التحضير', // الحالة الافتراضية عند الإنشاء
    );

    orders.add(newOrder);

    update();
  }

// تحديث حالة الطلب
  void updateOrderStatus(Order order, String newStatus) {
    order.status = newStatus;
    update();
  }

  void removeOrder(Order order) {
    orders.remove(order); // ✅ حذف من القائمة
    update(); // ✅ تحديث الواجهة
  }

  // الحصول على الطلبات الحالية
  // List<Order> get currentOrders =>//اذا كان بدي ياه ينحذف من الطلبات الحالية
  //     orders.where((order) => order.status != 'قيد التحضير ').toList();

  List<Order> get currentOrders =>
      orders; //مابينحذف بالطلبات الحالية بصير حالية وسابقة

  // الحصول على الطلبات السابقة
  List<Order> get previousOrders =>
      orders.where((order) => order.status == 'تم الارسال').toList();

  // آخر طلب
  Order? get lastOrder => orders.isNotEmpty ? orders.last : null;
}
