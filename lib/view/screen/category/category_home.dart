import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TitleOnly(title: "الفئات"),
          SizedBox(
            height: 40,
          ),
          GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.all(23),
                    child: Image.asset(categories[i].image),
                  ))
        ],
      ),
    );
  }
}
