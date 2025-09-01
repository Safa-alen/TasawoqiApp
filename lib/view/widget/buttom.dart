// import 'package:flutter/material.dart';
// import 'package:tasawoqi/core/constant/color.dart';

// class Buttom extends StatelessWidget {
//   const Buttom({
//     super.key,
//     required this.text,
//     this.onPressed,
//   });
//   final String text;
//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       margin: EdgeInsets.only(
//         top: 16,
//       ),
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Appcolor.aqua, borderRadius: BorderRadius.circular(15)),
//       child: MaterialButton(
//         onPressed: onPressed,
//         child: Center(
//             child: Text(text,
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleSmall!
//                     .copyWith(color: Appcolor.white, fontSize: 18))),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class Buttom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? fontSize; // حجم الخط اختياري
  final double? height; // ارتفاع الزر اختياري
  final double? width; // عرض الزر اختياري
  const Buttom({
    super.key,
    required this.text,
    this.onPressed,
    this.fontSize, // إذا مش محدد، يستخدم 18
    this.height = 56, // إذا مش محدد، يستخدم 56
    this.width = double.infinity, // إذا مش محدد، يستخدم double.infinity
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      margin: const EdgeInsets.only(top: 16),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Appcolor.aqua,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolor.white,
                  fontSize: fontSize ?? 18, // الافتراضي 18
                ),
          ),
        ),
      ),
    );
  }
}
