import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class buttom_navig_bar extends StatelessWidget {
  buttom_navig_bar({super.key});

  final items = <Widget>[
    SvgPicture.asset(AppImagess.icon8, color: Appcolor.medigrey),
    Icon(
      Icons.color_lens_outlined,
      color: Appcolor.medigrey,
    ),
    // SvgPicture.asset(AppImagess.icon5, color: Appcolor.aqua),
    const SizedBox(width: 60), // مكان الزر الأوسط
    SvgPicture.asset(AppImagess.icon6, color: Appcolor.medigrey),
    SvgPicture.asset(AppImagess.icon9, color: Appcolor.medigrey),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Stack(
        children: [
          // رسم البار مع الفجوة
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 75),
            painter: BNBCustomPainter(),
          ),
          // الأيقونات الجانبية
          Center(
            heightFactor: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  final double borderRadius = 30;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(borderRadius, 0);
    // path.moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(20),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    path.close();

    // ظل
    canvas.drawShadow(path, Appcolor.aqua.withOpacity(0.3), 5, true);
    // رسم البار
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
