// import 'package:flutter/material.dart';
// import 'package:tasawoqi/core/constant/color.dart';

// class SummaryRow extends StatelessWidget {
//   final String title;
//   final double value;
//   final bool bold;
//   const SummaryRow(
//       {super.key, required this.title, required this.value, this.bold = false});

//   @override
//   Widget build(BuildContext context) {
//     final style = TextStyle(
//       fontWeight: bold ? FontWeight.bold : FontWeight.w600,
//       fontSize: bold ? 20 : 18,
//     );
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("${value.toStringAsFixed(2)} \$", style: style),
//           Text(title, style: TextStyle(color: Appcolor.blacklight)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final double value;
  final bool bold;

  const SummaryRow({
    super.key,
    required this.title,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final valueStyle = TextStyle(
      fontWeight: FontWeight.w600, // 👈 القيمة تضل عادية
      fontSize: 18,
    );

    final titleStyle = TextStyle(
      fontWeight:
          bold ? FontWeight.bold : FontWeight.normal, // 👈 العنوان فقط بولد
      fontSize: bold ? 20 : 16,
      color: Appcolor.blacklight,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${value.toStringAsFixed(2)} \$", style: valueStyle),
          Text(title, style: titleStyle),
        ],
      ),
    );
  }
}
