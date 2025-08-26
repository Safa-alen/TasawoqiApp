// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/utils.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';
// import 'package:tasawoqi/core/constant/route.dart';
// import 'package:tasawoqi/view/widget/buttom.dart';
// import 'package:tasawoqi/view/widget/home/appbar_home.dart';

// class ControlPanelHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     bool storeOpen = true; // حالة المتجر

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(right: 24.0, left: 24, top: 24),
//         child: Column(
//           children: [
//             //   appbar_home(),
//             // صورة المتجر
//             Container(
//               height: 312,
//               width: 400,
//               child: ClipRRect(
//                 borderRadius: BorderRadiusGeometry.circular(12),
//                 child: Image.asset(
//                   AppImagess.reco1,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             // معلومات المتجر
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('مزارعنا',
//                       style: TextStyle(fontSize: 20, color: Appcolor.black)),
//                   SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       SizedBox(width: 4),
//                       Text('  عنوان المتجر',
//                           style: TextStyle(color: Colors.grey)),
//                       SvgPicture.asset(
//                         AppImagess.icon19,
//                         color: Appcolor.grey,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       SizedBox(width: 4),
//                       Text('أوقات الدوام: 09:00 ص - 10:00 م',
//                           style: TextStyle(color: Colors.grey)),
//                       Icon(Icons.access_time, size: 16, color: Colors.grey),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   const Text(
//                     'وصف قصير للمتجر هنا...وصف قصير للمتجر هنا...',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   SizedBox(height: 16),
//                   // Switch حالة المتجر
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('حالة المتجر (مفتوح)',
//                           style:
//                               TextStyle(fontSize: 16, color: Appcolor.black)),
//                       Switch(
//                         value: storeOpen,
//                         onChanged: (val) {
//                           // فقط تنفيذ الوظيفة، بدون setState
//                         },
//                         thumbColor: MaterialStateProperty.resolveWith<Color>(
//                           (states) {
//                             if (states.contains(MaterialState.selected)) {
//                               return Colors.white; // اللون الأبيض عند التفعيل
//                             }
//                             return Colors.grey; // اللون عند عدم التفعيل
//                           },
//                         ),
//                         trackColor: MaterialStateProperty.resolveWith<Color>(
//                           (states) {
//                             if (states.contains(MaterialState.selected)) {
//                               return Appcolor.aqua; // لون المسار عند التفعيل
//                             }
//                             return Colors
//                                 .grey.shade300; // لون المسار عند عدم التفعيل
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   // الأزرار: المنتجات، الطلبات، الرصيد
//                   Column(
//                     //  crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       storeCard('المنتجات', 20),
//                       storeCard('الطلبات', 3),
//                       storeCard('الرصيد', 43),
//                     ],
//                   ),
//                   SizedBox(height: 24),
//                   // زر عرض المتجر
//                   Buttom(text: "عرض متجري كزائر"),
//                   SizedBox(height: 64),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget storeCard(String title, int count) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min, // مهم ليأخذ حجم محتواه فقط

//           children: [
//             Text('($count)',
//                 style: TextStyle(color: Colors.teal, fontSize: 18)),
//             Text(
//               title,
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//         title: Align(
//             alignment: AlignmentGeometry.centerLeft,
//             child: InkWell(
//               onTap: () {
//                 Get.toNamed(AppRoute.productPanelHome);
//               },
//               child: Icon(Icons.arrow_back_ios_new_outlined,
//                   size: 16, color: Colors.grey),
//             )),
//         onTap: () {},
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart';

class ControlPanelHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool storeOpen = true; // حالة المتجر

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0, left: 24, top: 24),
        child: Column(
          children: [
            // صورة المتجر
            Container(
              height: 312,
              width: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppImagess.reco1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // معلومات المتجر
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('مزارعنا',
                      style: TextStyle(fontSize: 20, color: Appcolor.black)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 4),
                      Text('  عنوان المتجر',
                          style: TextStyle(color: Colors.grey)),
                      SvgPicture.asset(
                        AppImagess.icon19,
                        color: Appcolor.grey,
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 4),
                      Text('أوقات الدوام: 09:00 ص - 10:00 م',
                          style: TextStyle(color: Colors.grey)),
                      Icon(Icons.access_time, size: 16, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 8),
                  const Text(
                    'وصف قصير للمتجر هنا...وصف قصير للمتجر هنا...',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  // Switch حالة المتجر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('حالة المتجر (مفتوح)',
                          style:
                              TextStyle(fontSize: 16, color: Appcolor.black)),
                      Switch(
                        value: storeOpen,
                        onChanged: (val) {
                          // فقط تنفيذ الوظيفة، بدون setState
                        },
                        thumbColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.white; // اللون الأبيض عند التفعيل
                            }
                            return Colors.grey; // اللون عند عدم التفعيل
                          },
                        ),
                        trackColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(MaterialState.selected)) {
                              return Appcolor.aqua; // لون المسار عند التفعيل
                            }
                            return Colors
                                .grey.shade300; // لون المسار عند عدم التفعيل
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // الأزرار: المنتجات، الطلبات، الرصيد
                  Column(
                    children: [
                      storeCard('المنتجات', 20, AppRoute.productPanelHome),
                      storeCard('الطلبات', 3, AppRoute.orderpanelHome),
                      storeCard('الرصيد', 43, AppRoute.balancepanelHome),
                    ],
                  ),
                  SizedBox(height: 24),
                  // زر عرض المتجر
                  Buttom(text: "عرض متجري كزائر  "),
                  SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget storeCard(String title, int count, String route) {
    return Card(
      color: Appcolor.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('($count)',
                style: const TextStyle(color: Colors.teal, fontSize: 18)),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () => Get.toNamed(
              route,
              arguments: {"title": title, "count": count}, // نمرر البيانات
            ),
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
