import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';

class category_best_use extends StatelessWidget {
  const category_best_use({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: BestCategories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16, crossAxisCount: 2, mainAxisExtent: 255.0),
      itemBuilder: (context, i) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                BestCategories[i].image,
                height: 132,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.only(right: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //  overflow: TextOverflow.ellipsis,
                      BestCategories[i].title1,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 5),
                    Text(
                      BestCategories[i].titl2,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      BestCategories[i].title3,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontFamily: 'Poppins',
                          // fontWeight: FontWeight.normal,
                          color: Appcolor.aqua),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Container(
                height: 28,
                width: 160,
                decoration: BoxDecoration(
                  color: Appcolor.aqua,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: Appcolor.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
