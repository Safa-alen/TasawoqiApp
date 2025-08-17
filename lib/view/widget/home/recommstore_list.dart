import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';

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
        itemBuilder: (context, i) => _buildCard(context, i),
      );
    } else {
      // عرض List أفقي
      return SizedBox(
        height: 210,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Recommstores.length,
          itemBuilder: (context, i) => SizedBox(
            width: 160,
            child: _buildCard(context, i),
          ),
        ),
      );
    }
  }

  Widget _buildCard(BuildContext context, int i) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                Recommstores[i].image,
                width: 190,
                height: 132,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              Recommstores[i].title1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
            Text(
              Recommstores[i].title2,
              maxLines: 1, // سطر واحد
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
