// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:tasawoqi/core/constant/imagess.dart';

// // class search_home extends StatelessWidget {
// //   final double width;
// //   final double height;
// //   final bool showPrefixIcon;

// //   const search_home({
// //     super.key,
// //     this.width = 350,
// //     this.height = 48,
// //     this.showPrefixIcon = true, // افتراضي يظهر الأيقونة
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       elevation: 3,
// //       shadowColor: Colors.black26,
// //       borderRadius: BorderRadius.circular(15),
// //       child: Container(
// //         height: height,
// //         width: width,
// //         child: TextField(
// //           textAlign: TextAlign.right, // المحاذاة للنص
// //           textDirection: TextDirection.ltr, // المؤشر على اليمين
// //           cursorHeight: 16, // الطول أصغر
// //           cursorWidth: 1.5, // العرض أنحف
// //           decoration: InputDecoration(
// //             // أيقونة prefix حسب الحالة
// //             prefixIcon: showPrefixIcon
// //                 ? Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: SvgPicture.asset(
// //                       AppImagess.icon3,
// //                       width: 20,
// //                       height: 20,
// //                     ),
// //                   )
// //                 : null,

// //             // كلمة "بحث" + أيقونة العدسة
// //             suffixIcon: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Row(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Text(
// //                     "بحث",
// //                     style: TextStyle(fontSize: 15),
// //                   ),
// //                   SizedBox(width: 4),
// //                   SvgPicture.asset(
// //                     AppImagess.icon2,
// //                     width: 20,
// //                     height: 20,
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             enabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //               borderSide: BorderSide(color: Color.fromARGB(255, 220, 219, 219)),
// //             ),
// //             focusedBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(12),
// //                 borderSide: BorderSide(
// //                   color: Color.fromARGB(255, 220, 219, 219),
// //                 )),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/search_controller.dart'
//     show SearchFilterController;
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';

// class search_home extends StatelessWidget {
//   final double width;
//   final double height;
//   final bool showPrefixIcon;

//   const search_home({
//     super.key,
//     this.width = 350,
//     this.height = 48,
//     this.showPrefixIcon = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = Get.put(SearchFilterController());

//     return GetBuilder<SearchFilterController>(
//       builder: (_) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // TextField البحث
//             Container(
//                 color: Appcolor.white,
//                 height: height,
//                 width: width,
//                 child: TextField(
//                   onTap: () => ctrl.setShowFilters(true),
//                   textAlign: TextAlign.right,
//                   textDirection: TextDirection.ltr,
//                   cursorHeight: 16,
//                   cursorWidth: 1.5,
//                   decoration: InputDecoration(
//                     prefixIcon: showPrefixIcon
//                         ? Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               AppImagess.icon3,
//                               width: 20,
//                               height: 20,
//                             ),
//                           )
//                         : null,
//                     suffixIcon: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Text("بحث", style: TextStyle(fontSize: 15)),
//                           const SizedBox(width: 4),
//                           SvgPicture.asset(
//                             AppImagess.icon2,
//                             width: 20,
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),

//                     // لما ما يكون مضغوط عليه (فيه إطار كامل)
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         topRight: Radius.circular(12),
//                         bottomLeft: Radius.circular(12),
//                         bottomRight: Radius.circular(12),
//                       ),
//                       borderSide: const BorderSide(
//                         color: Color(0xFFE0E0E0),
//                       ),
//                     ),

//                     // لما يصير مضغوط عليه (Focus) --> بدون حد سفلي
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         topRight: Radius.circular(12),
//                       ),
//                       borderSide: const BorderSide(
//                         color: Color(0xFFE0E0E0),
//                       ),
//                     ),
//                   ),
//                 )),

//             //  const SizedBox(height: 8),

//             // مستطيل كامل للفلاتر
//             if (ctrl.showFilters)
//               Container(
//                 width: width,
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: const BorderSide(
//                         color: Color.fromARGB(255, 215, 49, 49)), // نفس اللون
//                     left: const BorderSide(color: Color(0xFFE0E0E0)),
//                     right: const BorderSide(color: Color(0xFFE0E0E0)),
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(12),
//                     bottomRight: Radius.circular(12),
//                   ),
//                   color: Color(0xFFFCFCFC), // خلفية المستطيل
//                 ),
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.end,
//                   children: ctrl.filters.map((option) {
//                     final isChecked = ctrl.selectedOption == option;
//                     return GestureDetector(
//                       onTap: () => ctrl.selectOption(option),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 6),
//                         child: Row(
//                           children: [
//                             Checkbox(
//                               value: isChecked,
//                               activeColor: Colors.teal,
//                               onChanged: (_) => ctrl.selectOption(option),
//                             ),
//                             Text(option, style: const TextStyle(fontSize: 14)),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               )
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/search_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class search_home extends StatelessWidget {
  final double width;
  final double height;
  final bool showPrefixIcon;

  const search_home({
    super.key,
    this.width = 350,
    this.height = 48,
    this.showPrefixIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(SearchFilterController());

    return GetBuilder<SearchFilterController>(
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // إذا كبست برا المستطيل → يتسكر
            if (ctrl.showFilters) {
              ctrl.setShowFilters(false);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField البحث
              Container(
                color: Appcolor.white,
                height: height,
                width: width,
                child: TextField(
                  onTap: () => ctrl.setShowFilters(true),
                  onChanged: (value) =>
                      ctrl.filterOptions(value), // ✅ البحث المباشر

                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  // style: const TextStyle(
                  //   // ✅ حجم النص أصغر
                  //   fontSize: 14,
                  //   color: Colors.black,
                  // ),

                  cursorHeight: 16,
                  cursorWidth: 1.5,
                  decoration: InputDecoration(
                    hintText: "بحث",
                    hintStyle:
                        TextStyle(color: Appcolor.lightGrey, fontSize: 14),
                    prefixIcon: showPrefixIcon
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              AppImagess.icon3,
                              width: 20,
                              height: 20,
                            ),
                          )
                        : null,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //   const Text("بحث", style: TextStyle(fontSize: 15)),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            AppImagess.icon2,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                    // لما ما يكون مضغوط عليه (فيه إطار كامل)
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0),
                      ),
                    ),

                    // لما يصير مضغوط عليه (Focus) --> بدون حد سفلي
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                  ),
                ),
              ),

              // مستطيل كامل للفلاتر
              if (ctrl.showFilters)
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Color(0xFFE0E0E0)),
                      right: BorderSide(color: Color(0xFFE0E0E0)),
                      bottom: BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color(0xFFFCFCFC), // خلفية المستطيل
                  ),
                  child: Column(
                    children: ctrl.filteredFilters.map((option) {
                      //  children: ctrl.filters.map((option) {
                      final isChecked = ctrl.selectedOption == option;
                      return GestureDetector(
                        onTap: () => ctrl.selectOption(option),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  option,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              Checkbox(
                                value: isChecked,
                                activeColor: Colors.teal,
                                onChanged: (_) => ctrl.selectOption(option),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
