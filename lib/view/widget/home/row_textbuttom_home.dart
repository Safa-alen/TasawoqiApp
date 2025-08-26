import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

import '../../../core/constant/color.dart';

class Row_textbuttom extends StatelessWidget {
  const Row_textbuttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.chevron_left,
              color: Appcolor.grey,
            ),
            SizedBox(width: 1),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Get.toNamed(AppRoute.catogeryHome);
              },
              child: Text("عرض الكل",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16)),
            ),
          ],
        ),
        TitleOnly(
          title: 'الفئات',
        ),
      ],
    );
  }
}
