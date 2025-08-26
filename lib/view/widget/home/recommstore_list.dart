import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/data/datasource/static/recommstore.dart';
import 'package:tasawoqi/view/widget/home/build_card_store.dart';

class RecommstoreList extends StatelessWidget {
  final bool isGrid; // تحددي من بره إذا Grid أو List

  RecommstoreList({
    super.key,
    this.isGrid = false, // الافتراضي List
  });

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      // عرض Grid
      return GridView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // عشان ما يصير Scroll داخل Scroll
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة
            childAspectRatio: 0.75, // نسبة العرض للارتفاع

            crossAxisSpacing: 10,
            mainAxisExtent: 215.0),
        itemCount: Recommstores.length,
        itemBuilder: (context, i) => buildCardStore(context, i),
      );
    } else {
      // عرض List أفقي
      return SizedBox(
        height: 210,
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Recommstores.length,
          itemBuilder: (context, i) => SizedBox(
            width: 160,
            child: buildCardStore(context, i),
          ),
        ),
      );
    }
  }
}
