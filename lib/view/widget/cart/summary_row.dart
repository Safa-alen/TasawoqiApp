import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final double value;
  final bool bold;
  const SummaryRow(
      {super.key, required this.title, required this.value, this.bold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.w600,
      fontSize: bold ? 20 : 18,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${value.toStringAsFixed(2)} \$", style: style),
          Text(title, style: TextStyle(color: Appcolor.blacklight)),
        ],
      ),
    );
  }
}
