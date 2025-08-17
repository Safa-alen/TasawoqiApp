import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleOnly extends StatelessWidget {
  const TitleOnly({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      // overflow: TextOverflow.ellipsis,
      // maxLines: 1,
      //  textAlign: TextAlign.right,
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
    );
  }
}
