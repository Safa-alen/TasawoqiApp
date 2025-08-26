// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../core/constant/imagess.dart';

// class TextfieldLocation extends StatelessWidget {
//   const TextfieldLocation({
//     super.key,
//     required this.hinttext,
//     this.icon,
//   });
//   final String hinttext;
//   final String? icon;
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       elevation: 3, // درجة الظل
//       shadowColor: Colors.black26.withOpacity(0.3),
//       borderRadius: BorderRadius.circular(15),
//       child: TextFormField(
//         readOnly: true,
//         textAlign: TextAlign.right,
//         textAlignVertical: TextAlignVertical.center,
//         decoration: InputDecoration(
//           hintText: hinttext,
//           hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontSize: 12,
//               ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide:
//                 BorderSide(color: const Color.fromARGB(255, 225, 224, 224)),
//           ),
//           suffixIcon: icon != null
//               ? Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SvgPicture.asset(icon!))
//               : null,
//           // إذا ما في أيقونة، يضل null
//         ),
//         onTap: () {},
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextfieldLocation extends StatelessWidget {
  const TextfieldLocation({
    super.key,
    required this.hinttext,
    this.icon,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.verticalPadding = 12, // الافتراضي 12
    //this.textAlignVertical = TextAlignVertical.top, // الافتراضي: منتصف
  });

  final String hinttext;
  final String? icon;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final double verticalPadding;
  //final TextAlignVertical textAlignVertical; // للتحكم بمكان النص عموديًا
  // هنا التحكم بالارتفاع

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3, // درجة الظل
      shadowColor: Colors.black26.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.top, // يخلي النص فوق

        // textAlignVertical: textAlignVertical, // هنا طبقنا المتغير
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
              ),
          contentPadding: EdgeInsets.only(
              top: verticalPadding, // فقط من الأعلى
              bottom: 12,
              right: 20 // مسافة صغيرة من الأسفل
              ),
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: verticalPadding, horizontal: 30), // اس
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 225, 224, 224)),
          ),
          suffixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(icon!),
                )
              : null,
        ),
      ),
    );
  }
}
