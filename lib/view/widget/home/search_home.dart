// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:tasawoqi/core/constant/color.dart';
// // import 'package:tasawoqi/core/constant/imagess.dart';

// // class search_home extends StatelessWidget {
// //   const search_home({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       elevation: 3, // درجة الظل
// //       shadowColor: Colors.black26,
// //       borderRadius: BorderRadius.circular(15),
// //       child: Container(
// //         height: 48,
// //         width: 380,
// //         child: TextField(
// //           textAlign: TextAlign.right,
// //           decoration: InputDecoration(
// //             // أيقونة صغيرة على اليسار
// //             prefixIcon: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: SvgPicture.asset(
// //                 AppImagess.icon3,
// //                 width: 20,
// //                 height: 20,
// //               ),
// //             ),
// //             prefixIconConstraints: BoxConstraints(
// //               minWidth: 40,
// //               minHeight: 40,
// //             ),

// //             // كلمة "بحث" وأيقونة على اليمين
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

// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //               borderSide: BorderSide(color: Colors.grey),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';

// class search_home extends StatelessWidget {
//   final double width;
//   final double height;
//   final bool showPrefixIcon;

//   const search_home({
//     super.key,
//     this.width = 300,
//     this.height = 48,
//     this.showPrefixIcon = true, // افتراضي يظهر الأيقونة
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 3,
//       shadowColor: Colors.black26,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         //color: Appcolor.white,
//         height: height,
//         width: width,
//         child: TextField(
//           textAlign: TextAlign.right,
//           textDirection: TextDirection.ltr, // هنا صار المؤشر على اليمين

//           cursorHeight: 16, // الطول أصغر
//           cursorWidth: 1.5, // العرض أنحف
//           decoration: InputDecoration(
//             // لو showPrefixIcon = true رح يبين، إذا false رح يختفي
//             prefixIcon: showPrefixIcon
//                 ? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SvgPicture.asset(
//                       AppImagess.icon3,
//                       width: 20,
//                       height: 20,
//                     ),
//                   )
//                 : null,

//             // كلمة "بحث" + أيقونة العدسة
//             suffixIcon: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "بحث",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   SizedBox(width: 4),
//                   SvgPicture.asset(
//                     AppImagess.icon2,
//                     width: 20,
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color.fromARGB(255, 220, 219, 219)),
//             ),

//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color.fromARGB(255, 220, 219, 219)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class search_home extends StatelessWidget {
  final double width;
  final double height;
  final bool showPrefixIcon;

  const search_home({
    super.key,
    this.width = 350,
    this.height = 48,
    this.showPrefixIcon = true, // افتراضي يظهر الأيقونة
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: height,
        width: width,
        child: TextField(
          textAlign: TextAlign.right, // المحاذاة للنص
          textDirection: TextDirection.ltr, // المؤشر على اليمين
          cursorHeight: 16, // الطول أصغر
          cursorWidth: 1.5, // العرض أنحف
          decoration: InputDecoration(
            // أيقونة prefix حسب الحالة
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

            // كلمة "بحث" + أيقونة العدسة
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "بحث",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 4),
                  SvgPicture.asset(
                    AppImagess.icon2,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color.fromARGB(255, 220, 219, 219)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 220, 219, 219),
                )),
          ),
        ),
      ),
    );
  }
}
