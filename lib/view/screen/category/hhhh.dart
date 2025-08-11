// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:tasawoqi/data/datasource/categoy.dart';

// class Hhhh extends StatelessWidget {
//   const Hhhh({super.key, required this.text});
// final String text;
//   @override
//   Widget build(BuildContext context) {

//      final routeArgument = ModalRoute.of(context)!.settings.arguments
//         as Map; //هون عم ناخد البيانات يلي تم تمريرها عند الانتقال للشاشة،
//  //هون عم نستخرج قيمة id و title من الماب.
//     final categoryTitle = routeArgument['title'];
//  final categoryImage = routeArgument['image'];

//     final filtercategories = categories.where((categories) {
//       //هون عم نستخرج قيمة id و title من الماب.
//       return categories.contains(categoryTitle);
//     }).toList();
//     return  Scaffold(
// appBar: AppBar(title:text),



//     );
//   }
// }