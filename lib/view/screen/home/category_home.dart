import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/view/widget/home/list_images.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            title: Align(
                alignment: Alignment.centerRight,
                child: TitleOnly(
                  title: "الفئات",
                )),
          ),
          body: List_Images()),
    );
  }
}
