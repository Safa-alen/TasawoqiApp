import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 50,
        // ),
        Image.asset(
          AppImagess.Logo,
        ),
        // SizedBox(
        //   height: 64,
        // )
      ],
    );
  }
}
