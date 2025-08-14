import 'package:flutter/material.dart';
import 'package:tasawoqi/view/widget/home/appbar_home.dart';

import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class OffersHome extends StatelessWidget {
  const OffersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 74,
        ),
        child: Column(children: [
          SizedBox(
            height: 24,
          ),
          Align(alignment: Alignment.center, child: TitleOnly(title: "العروض")),
          SizedBox(
            height: 24,
          ),
          search_home(),
        ]));
  }
}
