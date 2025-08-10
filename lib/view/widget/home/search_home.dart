import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class search_home extends StatelessWidget {
  const search_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 312,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                AppImagess.icon3,
              ),
            ),
            prefixIcon: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(14.0), // عشان تظبط مسافة الأيقونة
                  child: SvgPicture.asset(
                    AppImagess.icon2,
                  ),
                ),
                Text(
                  "بحث",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                      ),
                ),
              ],
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
