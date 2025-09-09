import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/data/datasource/static/recommstore.dart';

Widget buildCardStore(BuildContext context, int i) {
  return InkWell(
    onTap: () {
      Get.toNamed(AppRoute.storeDetails, arguments: Recommstores[i]);
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
    ),
  );
}
