import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/view/widget/home/appbar_home.dart';
import 'package:tasawoqi/view/widget/home/category_type_widget.dart';

import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class OffersHome extends StatelessWidget {
  const OffersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          Align(alignment: Alignment.center, child: TitleOnly(title: "العروض")),
          SizedBox(
            height: 24,
          ),
          search_home(),
          SizedBox(
            height: 24,
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: 255.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Offers.length,
            itemBuilder: (context, index) {
              final offer = Offers[index]; // عنصر العرض الحالي

              return InkWell(
                onTap: () {},
                child: CategoryTypeWidget(
                  image: offer.imageo,
                  title1: offer.title1o,
                  title2: offer.title2o,
                  title3: offer.title3o,
                  index: index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
