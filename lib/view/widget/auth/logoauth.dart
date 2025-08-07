import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64,
        ),
        Image.asset(
          AppImagess.Logo,
        ),
      ],
    );
  }
}
