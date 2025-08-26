import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class OrderpanelHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String title = args["title"];
    final int count = args["count"];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
            title: TitleOnly(
          title: title,
        )),
        body: Center(
          child: Text("عدد العناصر: $count"),
        ),
      ),
    );
  }
}
