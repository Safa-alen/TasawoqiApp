import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class Buttom extends StatelessWidget {
  const Buttom({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.only(top: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Appcolor.aqua, borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        onPressed: () {},
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
