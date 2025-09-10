////الفئاااااااات بالصفحة الرئيسية

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/route.dart';

import '../../../data/datasource/static/categoy.dart';

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
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        AppRoute.catogerType,
                        parameters: {
                          'id': categories[i].id,
                          'title': categories[i].title,
                        },
                      );
                    },
                    child: Container(
                        width: 85,
                        //  height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 201, 200, 200),
                                width: 1),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(categories[i].title,
                                style: TextStyle(
                                    color: Appcolor.medigrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)
                                // Theme.of(context)
                                //     .textTheme
                                //     .titleSmall!
                                //     .copyWith(
                                //         fontFamily: 'Poppins',
                                //         fontWeight: FontWeight.w500),
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
