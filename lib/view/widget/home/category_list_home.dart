import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/color.dart';

import '../../../data/datasource/categoy.dart';

class category_list_home extends StatelessWidget {
  const category_list_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Get.toNamed(page)
                    },
                    child: Container(
                        width: 85,
                        // height: 32,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Appcolor.medigrey, width: 0.31),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          categories[i].title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500),
                        ))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )),
    );
  }
}
