// // كرت الطلب

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart'
//     show Card, CircleAvatar, Colors, StatelessWidget, Widget;
// import 'package:flutter_svg/svg.dart';

// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';

// import 'package:tasawoqi/view/widget/order/build_order_row.dart'
//     show buildOrderRow;
// import 'package:tasawoqi/view/widget/order/build_detail_row.dart';
// import 'package:tasawoqi/view/widget/product_panel/divider_widget.dart';

// class CardOrderPanel extends StatelessWidget {
//   final order;
//   final bool isLast;
//   final bool isCurrent;

//   const CardOrderPanel({
//     super.key,
//     required this.order,
//     required this.isLast,
//     required this.isCurrent,
//   });

//   String get displayPayment => order.payment == 'cash'
//       ? 'عند الاستلام'
//       : order.payment == 'app'
//           ? 'التطبيق'
//           : order.payment;

//   String get displayAddress => order.address == 'home'
//       ? 'منزل'
//       : order.address == 'office'
//           ? 'مكتب'
//           : '—';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           elevation: 2,
//           child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     buildOrderRow(order.number, order.date),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               const Text(
//                                 "تم توصيل الطلب",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black),
//                               ),
//                               Text(
//                                 "شكراً لاستخدامك تطبيقنا",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Appcolor.aqua),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         const CircleAvatar(
//                           radius: 24,
//                           backgroundImage: AssetImage(AppImagess.cat1),
//                         ),
//                       ],
//                     ),
//                     DividerWidget(),
//                     buildDetailRow("طريقة الدفع", displayPayment,
//                         titleColor: Appcolor.grey3),
//                     buildDetailRow(
//                       " الإجمالي",
//                       "₺${order.totalPrice.toStringAsFixed(2)}",
//                       titleColor: Appcolor.grey3,
//                     ),
//                     buildDetailRow(
//                       " العمولة",
//                       "₺${order.totalPrice.toStringAsFixed(2)}",
//                       titleColor: Appcolor.grey3,
//                     ),
//                     buildDetailRow(
//                         " الصافي", "₺${order.totalPrice.toStringAsFixed(2)}",
//                         valueColor: Appcolor.aqua),
//                     DividerWidget(),
//                     // buildDetailRow(":العنوان", displayAddress),
//                     if (isCurrent)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               SvgPicture.asset(AppImagess.icon25),
//                               Text(
//                                 "الاتصال بالسائق أحمد الأحمد",
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 displayAddress,
//                                 style: TextStyle(color: Appcolor.black),
//                               ),
//                               Text(
//                                 ":العنوان",
//                                 style: TextStyle(color: Appcolor.black),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )
//                     else
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // يسار: اسم السائق فقط (بدون أيقونة)
//                             Text(
//                               "اسم السائق",
//                               style: TextStyle(
//                                   color: Appcolor.grey3, fontSize: 14),
//                             ),

//                             // يمين: العنوان
//                             Row(
//                               children: [
//                                 Text(
//                                   displayAddress,
//                                   style: TextStyle(color: Appcolor.black),
//                                 ),
//                                 Text(
//                                   ":العنوان",
//                                   style: TextStyle(color: Appcolor.black),
//                                 ),
//                               ],
//                             ),

//                             // SizedBox(height: 16),
//                             // if (!isCurrent) PreviousRequestOrder(order: order),
//                           ]),
//                   ]))),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Card, CircleAvatar, Colors, StatelessWidget, Widget;
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/widget/order/build_order_row.dart';
import 'package:tasawoqi/view/widget/order/build_detail_row.dart';
import 'package:tasawoqi/view/widget/product_panel/divider_widget.dart';

class CardOrderPanel extends StatelessWidget {
  final order;
  final bool isLast;
  final bool isCurrent;

  const CardOrderPanel({
    super.key,
    required this.order,
    required this.isLast,
    required this.isCurrent,
  });

  String get displayPayment => order.payment == 'cash'
      ? 'عند الاستلام'
      : order.payment == 'app'
          ? 'التطبيق'
          : order.payment;

  String get displayAddress => order.address == 'home'
      ? 'منزل'
      : order.address == 'office'
          ? 'مكتب'
          : '—';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildOrderRow(order.number, order.date),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "تم توصيل الطلب",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          "شكراً لاستخدامك تطبيقنا",
                          style: TextStyle(fontSize: 12, color: Appcolor.aqua),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AppImagess.cat1),
                  ),
                ],
              ),
              DividerWidget(),
              buildDetailRow("طريقة الدفع", displayPayment,
                  titleColor: Appcolor.grey3),
              buildDetailRow(
                  " الإجمالي", "₺${order.totalPrice.toStringAsFixed(2)}",
                  titleColor: Appcolor.grey3),
              buildDetailRow(
                  " العمولة", "₺${order.totalPrice.toStringAsFixed(2)}",
                  titleColor: Appcolor.grey3),
              buildDetailRow(
                  " الصافي", "₺${order.totalPrice.toStringAsFixed(2)}",
                  valueColor: Appcolor.aqua),
              DividerWidget(),
              if (isCurrent)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppImagess.icon25),
                        const SizedBox(width: 4),
                        const Text(
                          "الاتصال بالسائق أحمد الأحمد",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(displayAddress,
                            style: TextStyle(color: Appcolor.black)),
                        Text(":العنوان",
                            style: TextStyle(color: Appcolor.black)),
                      ],
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اسم السائق",
                      style: TextStyle(color: Appcolor.grey3, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(displayAddress,
                            style: TextStyle(color: Appcolor.black)),
                        Text(":العنوان",
                            style: TextStyle(color: Appcolor.black)),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
