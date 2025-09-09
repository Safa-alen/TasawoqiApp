import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasawoqi/core/constant/color.dart';

class IconButtonn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const IconButtonn(
      {super.key,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 32,
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(1, 1))
        ],
      ),
      child: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Icon(icon, size: 18, color: color),
          onPressed: onTap),
    );
  }
}
