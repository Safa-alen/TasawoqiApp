import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';

import 'package:tasawoqi/view/widget/home/recommstore_list.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class StoresHome extends StatelessWidget {
  const StoresHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Align(
              alignment: Alignment.center, child: TitleOnly(title: "المتاجر")),
          SizedBox(
            height: 24,
          ),
          search_home(),
          SizedBox(
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
