import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/order_controller.dart';
import 'package:tasawoqi/controller/home/payment_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class PaymentHome extends StatelessWidget {
  PaymentHome({super.key});

  final TextEditingController homeController = TextEditingController();
  final TextEditingController officeController = TextEditingController();
  final FocusNode homeFocusNode = FocusNode();
  final FocusNode officeFocusNode = FocusNode();

  final totalPrice = (Get.arguments?['totalPrice']) ?? 0.0;

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find<PaymentController>();
    final OrderController orderCtrl = Get.find<OrderController>();

    Widget addressField({
      required String type,
      required String label,
      required String hint,
      required FocusNode focusNode,
      required TextEditingController textController,
    }) {
      return Stack(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                RadioListTile<String>(
                  value: type,
                  groupValue: controller.selectedOption1,
                  onChanged: (value) => controller.selectOption1(value!),
                  title: Text(label,
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15)),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Appcolor.aqua,
                ),
                TextField(
                  focusNode: focusNode,
                  controller: type == 'home'
                      ? TextEditingController(text: controller.homeNote)
                      : TextEditingController(text: controller.officeNote),
                  maxLines: 3,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14, color: Appcolor.grey),
                  enabled: controller.selectedOption1 == type,
                  onChanged: type == 'home'
                      ? controller.updateHomeNote
                      : controller.updateOfficeNote,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(fontSize: 14, color: Appcolor.grey),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 19),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: type == 'home' ? 15 : 25,
            left: type == 'home' ? 15 : 25,
            child: InkWell(
              onTap: () => FocusScope.of(context).requestFocus(focusNode),
              child: SvgPicture.asset(AppImagess.icon22, color: Appcolor.grey),
            ),
          ),
        ],
      );
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: TitleOnly(title: "الدفع"),
              )),
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
                addressField(
                  type: 'home',
                  label: 'منزل',
                  hint:
                      "+971 123 456 789\n,معرة مصرين, شارع الجميل, جانب حلويات الاحمد, الطابق الثالث",
                  focusNode: homeFocusNode,
                  textController: homeController,
                ),
                const SizedBox(height: 16),
                addressField(
                  type: 'office',
                  label: 'مكتب',
                  hint:
                      "+971 987 654 321\n,عنوان المكتب, شارع التجاري, الطابق الثاني",
                  focusNode: officeFocusNode,
                  textController: officeController,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("طريقة الدفع",
                      style: TextStyle(fontSize: 18, color: Appcolor.black)),
                ),
                RadioListTile<String>(
                  value: 'cash',
                  groupValue: controller.selectedOption2,
                  onChanged: (value) => controller.selectOption2(value!),
                  title: Text("عند الاستلام",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15,
                          ),
                      textAlign: TextAlign.right),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Appcolor.aqua,
                ),
                RadioListTile<String>(
                  value: 'app',
                  groupValue: controller.selectedOption2,
                  onChanged: (value) => controller.selectOption2(value!),
                  title: Text("التطبيق",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15,
                          ),
                      textAlign: TextAlign.right),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Appcolor.aqua,
                ),
                const SizedBox(height: 72),
                Buttom(
                  text: "ارسال الطلب",
                  onPressed: () {
                    // هذا هو نوع العنوان: 'home' أو 'office'
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

                    orderCtrl.createOrder(
                      orderAddress: selectedAddressType, // النوع فقط
                      orderPayment: selectedPayment,
                      orderTotal: totalPrice,
                    );

// للتجربة: تحويل آخر طلب مباشرة إلى الطلبات السابقة
                    final last = orderCtrl.lastOrder;
                    if (last != null) {
                      orderCtrl.updateOrderStatus(last, 'تم الاستلام  ');
                    }

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

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/order_controller.dart';
// import 'package:tasawoqi/controller/home/payment_controller.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';
// import 'package:tasawoqi/core/constant/route.dart';
// import 'package:tasawoqi/view/widget/buttom.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart';

// class PaymentHome extends StatelessWidget {
//   PaymentHome({super.key});

//   final TextEditingController homeController = TextEditingController();
//   final TextEditingController officeController = TextEditingController();
//   final FocusNode homeFocusNode = FocusNode();
//   final FocusNode officeFocusNode = FocusNode();

//   final totalPrice = (Get.arguments?['totalPrice']) ?? 0.0;

//   @override
//   Widget build(BuildContext context) {
//     final PaymentController controller = Get.find<PaymentController>();
//     final OrderController orderCtrl = Get.find<OrderController>();

//     Widget addressField({
//       required String type,
//       required String label,
//       required String hint,
//       required FocusNode focusNode,
//       required TextEditingController textController,
//     }) {
//       return Stack(
//         children: [
//           Container(
//             height: 180,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade300, width: 1),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   spreadRadius: 5,
//                   blurRadius: 15,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 RadioListTile<String>(
//                   value: type,
//                   groupValue: controller.selectedOption1,
//                   onChanged: (value) => controller.selectOption1(value!),
//                   title: Text(label,
//                       textAlign: TextAlign.right,
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodySmall!
//                           .copyWith(fontSize: 15)),
//                   controlAffinity: ListTileControlAffinity.trailing,
//                   activeColor: Appcolor.aqua,
//                 ),
//                 TextField(
//                   focusNode: focusNode,
//                   controller: textController,
//                   maxLines: 3,
//                   textAlign: TextAlign.right,
//                   style: TextStyle(fontSize: 14, color: Appcolor.grey),
//                   enabled: controller.selectedOption1 == type,
//                   onChanged: type == 'home'
//                       ? controller.updateHomeNote
//                       : controller.updateOfficeNote,
//                   decoration: InputDecoration(
//                     hintText: hint,
//                     hintStyle: TextStyle(fontSize: 14, color: Appcolor.grey),
//                     border: InputBorder.none,
//                     contentPadding:
//                         const EdgeInsets.symmetric(vertical: 2, horizontal: 19),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: type == 'home' ? 15 : 25,
//             left: type == 'home' ? 15 : 25,
//             child: InkWell(
//               onTap: () => FocusScope.of(context).requestFocus(focusNode),
//               child: SvgPicture.asset(AppImagess.icon22, color: Appcolor.grey),
//             ),
//           ),
//         ],
//       );
//     }

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
//                 addressField(
//                   type: 'home',
//                   label: 'منزل',
//                   hint:
//                       "+971 123 456 789\n,معرة مصرين, شارع الجميل, جانب حلويات الاحمد, الطابق الثالث",
//                   focusNode: homeFocusNode,
//                   textController: homeController,
//                 ),
//                 const SizedBox(height: 16),
//                 addressField(
//                   type: 'office',
//                   label: 'مكتب',
//                   hint:
//                       "+971 987 654 321\n,عنوان المكتب, شارع التجاري, الطابق الثاني",
//                   focusNode: officeFocusNode,
//                   textController: officeController,
//                 ),
//                 const SizedBox(height: 24),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text("طريقة الدفع",
//                       style: TextStyle(fontSize: 18, color: Appcolor.black)),
//                 ),
//                 RadioListTile<String>(
//                   value: 'cash',
//                   groupValue: controller.selectedOption2,
//                   onChanged: (value) => controller.selectOption2(value!),
//                   title: Text("عند الاستلام",
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             fontSize: 15,
//                           ),
//                       textAlign: TextAlign.right),
//                   controlAffinity: ListTileControlAffinity.trailing,
//                   activeColor: Appcolor.aqua,
//                 ),
//                 RadioListTile<String>(
//                   value: 'app',
//                   groupValue: controller.selectedOption2,
//                   onChanged: (value) => controller.selectOption2(value!),
//                   title: Text("التطبيق",
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             fontSize: 15,
//                           ),
//                       textAlign: TextAlign.right),
//                   controlAffinity: ListTileControlAffinity.trailing,
//                   activeColor: Appcolor.aqua,
//                 ),
//                 const SizedBox(height: 72),
//                 Buttom(
//                   text: "ارسال الطلب",
//                   onPressed: () {
//                     String selectedAddress =
//                         controller.selectedOption1 == 'home'
//                             ? controller.homeNote
//                             : controller.officeNote;
//                     String? selectedPayment = controller.selectedOption2;

//                     // إضافة الطلب لقائمة الطلبات
//                     final orderCtrl = Get.find<OrderController>();
//                     orderCtrl.createOrder(
//                       orderAddress: selectedAddress,
//                       orderPayment: selectedPayment ?? 'غير محدد',
//                       orderTotal: totalPrice,
//                     );

//                     // الانتقال إلى صفحة TmHome (رقم الطلب فقط)
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
