import 'package:flutter/material.dart';

class AuthText extends StatelessWidget {
  const AuthText({
    super.key,
    required this.title,
    this.style,
  });
  final String title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}
