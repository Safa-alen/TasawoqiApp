import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/cart/product_card.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/payment/Address_field.dart';
import 'package:tasawoqi/view/widget/payment/payment_option.dart';

// class PaymentHome extends StatelessWidget {
//   PaymentHome({super.key});

//   final TextEditingController homeController = TextEditingController();
//   final TextEditingController officeController = TextEditingController();
//   final FocusNode homeFocusNode = FocusNode();
//   final FocusNode officeFocusNode = FocusNode();

//   final double totalPrice = (Get.arguments?['totalPrice']) ?? 0.0;

//   @override
//   Widget build(BuildContext context) {

//     final products = homeController.CartProductCard.map((p) => {
//   "image": p.Image,
//   "title1": p.title1,
//   "title2": p.title2,
//   "price": p.title3,
//   "quantity": p.quantity,
// }).toList();

//     // جلب البيانات من arguments
//     // final List<Map<String, dynamic>> products =
//     //     (Get.arguments?['products'] as List?)?.map((item) {
//     //           return Map<String, dynamic>.from(item);
//     //         }).toList() ??
//     //         [];
//     // جلب الكونترولر باستخدام GetX
//     final PaymentController controller = Get.find<PaymentController>();
//     final OrderController orderCtrl = Get.find<OrderController>();

//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: EdgeInsets.only(right: 24.0),
//                 child: TitleOnly(title: "الدفع"),
//               )),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(right: 24.0, left: 24, top: 40),
//           child: GetBuilder<PaymentController>(
//             builder: (_) => ListView(
//               children: [
//                 const Align(
//                   alignment: Alignment.centerRight,
//                   child: Text("العنوان", style: TextStyle(fontSize: 15)),
//                 ),
//                 const SizedBox(height: 12),
//                 // حقل المنزل
//                 AddressField(
//                   type: 'home',
//                   label: 'منزل',
//                   hint:
//                       "+971 123 456 789\nمعرة مصرين, شارع الجميل, جانب حلويات الاحمد, الطابق الثالث",
//                   controllerText: homeController,
//                   focusNode: homeFocusNode,
//                 ),
//                 const SizedBox(height: 16),
//                 // حقل المكتب
//                 AddressField(
//                   type: 'office',
//                   label: 'مكتب',
//                   hint:
//                       "+971 987 654 321\nعنوان المكتب, شارع التجاري, الطابق الثاني",
//                   controllerText: officeController,
//                   focusNode: officeFocusNode,
//                 ),
//                 const SizedBox(height: 24),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "طريقة الدفع",
//                     style: TextStyle(fontSize: 18, color: Appcolor.black),
//                   ),
//                 ),
//                 // خيارات الدفع
//                 PaymentOption(value: 'cash', label: "عند الاستلام"),
//                 PaymentOption(value: 'app', label: "التطبيق"),
//                 const SizedBox(height: 72),
//                 Buttom(
//                   text: "ارسال الطلب",
//                   onPressed: () {
//                     String selectedAddressType = controller.selectedOption1;
//                     String? selectedPayment = controller.selectedOption2;

//                     if (selectedAddressType.isEmpty) {
//                       Get.snackbar(
//                         "خطأ",
//                         "الرجاء تحديد العنوان",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Appcolor.aqua.withOpacity(0.7),
//                         colorText: Colors.white,
//                       );
//                       return;
//                     }

//                     if (selectedPayment == null || selectedPayment.isEmpty) {
//                       Get.snackbar(
//                         "خطأ",
//                         "الرجاء تحديد طريقة الدفع",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Appcolor.aqua.withOpacity(0.7),
//                         colorText: Colors.white,
//                       );
//                       return;
//                     }

//                     // إنشاء الطلب
//                     orderCtrl.createOrder(
//                       orderAddress: selectedAddressType,
//                       orderPayment: selectedPayment,
//                       orderTotal: totalPrice,
//                       products: products,
//                     );

//                     // للتجربة: تحديث آخر طلب
//                     final last = orderCtrl.lastOrder;
//                     if (last != null) {
//                       orderCtrl.updateOrderStatus(last, 'تم الاستلام');
//                     }

//                     // العودة للصفحة الرئيسية
//                     Get.offAllNamed(AppRoute.tmHome);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class PaymentHome extends StatelessWidget {
  PaymentHome({super.key});

  final TextEditingController homeController = TextEditingController();
  final TextEditingController officeController = TextEditingController();
  final FocusNode homeFocusNode = FocusNode();
  final FocusNode officeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // جلب البيانات من arguments
    final args = Get.arguments ?? {};
    final double totalPrice = args['totalPrice'] ?? 0.0;
    final double subtotal = args['subtotal'] ?? 0.0;
    final double shipping = args['shipping'] ?? 0.0;
    final double discount = args['discount'] ?? 0.0;

    final List<Map<String, dynamic>> products =
        (args['products'] as List?)?.map((item) {
              return Map<String, dynamic>.from(item);
            }).toList() ??
            [];

    final PaymentController controller = Get.find<PaymentController>();
    final OrderController orderCtrl = Get.find<OrderController>();
    final HomeScreenControllerImp homeScreenController =
        Get.find<HomeScreenControllerImp>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: TitleOnly(title: "الدفع"),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24, top: 40),
          child: GetBuilder<PaymentController>(
            builder: (_) => ListView(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text("العنوان", style: TextStyle(fontSize: 15)),
                ),
                const SizedBox(height: 12),
                AddressField(
                  type: 'home',
                  label: 'منزل',
                  hint:
                      "+971 123 456 789\nمعرة مصرين, شارع الجميل, جانب حلويات الاحمد, الطابق الثالث",
                  controllerText: homeController,
                  focusNode: homeFocusNode,
                ),
                const SizedBox(height: 16),
                AddressField(
                  type: 'office',
                  label: 'مكتب',
                  hint:
                      "+971 987 654 321\nعنوان المكتب, شارع التجاري, الطابق الثاني",
                  controllerText: officeController,
                  focusNode: officeFocusNode,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "طريقة الدفع",
                    style: TextStyle(fontSize: 18, color: Appcolor.black),
                  ),
                ),
                PaymentOption(value: 'cash', label: "عند الاستلام"),
                PaymentOption(value: 'app', label: "التطبيق"),
                const SizedBox(height: 72),
                Buttom(
                  text: "ارسال الطلب",
                  onPressed: () {
                    String selectedAddressType = controller.selectedOption1;
                    String? selectedPayment = controller.selectedOption2;

                    if (selectedAddressType.isEmpty) {
                      Get.snackbar(
                        "خطأ",
                        "الرجاء تحديد العنوان",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Appcolor.aqua.withOpacity(0.7),
                        colorText: Colors.white,
                      );
                      return;
                    }

                    if (selectedPayment == null || selectedPayment.isEmpty) {
                      Get.snackbar(
                        "خطأ",
                        "الرجاء تحديد طريقة الدفع",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Appcolor.aqua.withOpacity(0.7),
                        colorText: Colors.white,
                      );
                      return;
                    }

                    // إنشاء الطلب
                    orderCtrl.createOrder(
                      orderAddress: selectedAddressType,
                      orderPayment: selectedPayment,
                      orderTotal: totalPrice,
                      products: homeScreenController.cartProducts
                          .map((p) => {
                                "image": p.Image,
                                "title1": p.title1,
                                "title2": p.title2,
                                "price": p.title3,
                                "quantity": p.quantity,
                              })
                          .toList(),
                      subtotal: subtotal,
                      shipping: shipping,
                      discount: discount,
                    );
                    // للتجربة: تحديث آخر طلب
                    final last = orderCtrl.lastOrder;
                    if (last != null) {
                      orderCtrl.updateOrderStatus(last, 'تم الارسال');
                    }

                    // العودة للصفحة الرئيسية
                    Get.offAllNamed(AppRoute.tmHome);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
