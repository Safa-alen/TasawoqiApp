import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ui show TextDirection;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/data/datasource/static/categoy.dart' as order;
import 'package:tasawoqi/data/datasource/static/categoy.dart';

Widget buildOrderRow(String number, DateTime date) {
  final dateString = DateFormat("d MMM yyyy, hh:mm a").format(date);

  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: ui.TextDirection.rtl,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.ordersHome2, arguments: {
              "number": number,
              "date": date,
              "products": order.products, // ✅ المنتجات الخاصة بهالطلب
            });
          },
          child: Text(
            "رقم الطلب $number",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Appcolor.black, // خليها مميزة
            ),
          ),
        ),
        Text(
          dateString,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as ui show TextDirection;
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/route.dart';

// // نضيف products كوسيط
// Widget buildOrderRow(String number, DateTime date, List products) {
//   final dateString = DateFormat("d MMM yyyy, hh:mm a").format(date);

//   return Padding(
//     padding: const EdgeInsets.only(bottom: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       textDirection: ui.TextDirection.rtl,
//       children: [
//         InkWell(
//           onTap: () {
//             // تمرير البيانات لصفحة تفاصيل الطلب
//             Get.toNamed(AppRoute.ordersHome2, arguments: {
//               "number": number,
//               "date": date,
//               "products": products.map((p) {
//                 return {
//                   "image": p.Image,
//                   "title1": p.title1,
//                   "title2": p.title2,
//                   "price": p.title3,
//                   "quantity": p.quantity,
//                 };
//               }).toList(),
//             });
//           },
//           child: Text(
//             "رقم الطلب $number",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Appcolor.black,
//             ),
//           ),
//         ),
//         Text(
//           dateString,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//             fontSize: 16,
//           ),
//         ),
//       ],
//     ),
//   );
// }
