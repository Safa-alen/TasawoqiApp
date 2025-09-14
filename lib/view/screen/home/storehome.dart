import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/static/recommstore.dart';

import 'package:tasawoqi/view/widget/home/recommstore_list.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class StoresHome extends StatelessWidget {
  StoresHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 24),
      child: ListView(
        children: [
          const Align(
              alignment: Alignment.center, child: TitleOnly(title: "المتاجر")),
          const SizedBox(
            height: 24,
          ),
          search_home(),
          const SizedBox(
            height: 24,
          ),
          RecommstoreList(
            isGrid: true,
          ),
        ],
      ),
    );
  }
}
