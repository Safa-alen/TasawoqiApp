// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';
// import 'package:tasawoqi/data/datasource/categoy.dart';
// import 'package:tasawoqi/view/widget/home/appbar_home.dart';
// import 'package:tasawoqi/view/widget/home/ecommstore_list_home.dart';
// import 'package:tasawoqi/view/widget/home/row_textbuttom_home.dart';
// import 'package:tasawoqi/view/widget/home/search_home.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart';

// import '../../widget/home/category_list_home.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//          extendBody: true,
//         bottomNavigationBar: bottom_navig_bar(),

//         appBar: appbar_home(),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
//           child: ListView(
//             children: [
//               search_home(),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: double.infinity,
//                 child: Image.asset(
//                   AppImagess.home,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Row_textbuttom(),
//               SizedBox(
//                 height: 10,
//               ),
//               category_list_home(),
//               SizedBox(
//                 height: 24,
//               ),
//               TitleOnly(title: "متاجر موصى بها"),
//               SizedBox(
//                 height: 16,
//               ),
//               Recommstore_list(),
//               SizedBox(
//                 height: 15,
//               ),
//               TitleOnly(title: "المنتجات الأكثر طلبا  "),
//               SizedBox(
//                 height: 44,
//               ),
//               SizedBox(
//                 height: 210,
//                 child: GridView.builder(
//                     shrinkWrap: true, // يخليها تاخذ مساحة المحتوى فقط
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: BestCategories.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2),
//                     itemBuilder: (context, i) => SizedBox(
//                           width: 160,
//                           height: 198,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Column(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(
//                                     top: Radius.circular(12),
//                                   ),
//                                   child: Image.asset(
//                                     BestCategories[i].image,
//                                     height: 132,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Padding(
//                                   padding: EdgeInsets.all(8),
//                                   child: Column(
//                                     children: [
//                                       Text(BestCategories[i].title1,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall),
//                                       SizedBox(height: 5),
//                                       Text(
//                                         maxLines: 1, // سطر واحد فقط
//                                         overflow: TextOverflow.ellipsis,
//                                         BestCategories[i].titl2,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleSmall!
//                                             .copyWith(
//                                                 fontFamily: 'Poppins',
//                                                 fontWeight: FontWeight.w500),
//                                       ),
//                                       Text(
//                                         maxLines: 1, // سطر واحد فقط
//                                         overflow: TextOverflow.ellipsis,
//                                         BestCategories[i].title3,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleSmall!
//                                             .copyWith(
//                                                 fontFamily: 'Poppins',
//                                                 fontWeight: FontWeight.w500),
//                                       ),
//                                       Container(
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             color: Appcolor.aqua,
//                                             borderRadius:
//                                                 BorderRadius.circular(6)),
//                                         child: MaterialButton(
//                                           onPressed: () {},
//                                           child: Icon(Icons.add),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class bottom_navig_bar extends StatelessWidget {
//   bottom_navig_bar({
//     super.key,
//   });
//   final items = <Widget>[
//     SvgPicture.asset(
//       AppImagess.icon8,
//       color: Appcolor.medigrey,
//     ),
//     SvgPicture.asset(
//       AppImagess.icon5,
//       color: Appcolor.medigrey,
//     ),
//     SvgPicture.asset(
//       AppImagess.icon7,
//       color: Appcolor.medigrey,
//     ),
//     SvgPicture.asset(AppImagess.icon6, color: Appcolor.medigrey),
//     SvgPicture.asset(AppImagess.icon9, color: Appcolor.medigrey),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.transparent,
//           // color: Appcolor.aqua,
//           boxShadow: [
//             BoxShadow(
//                 color: Appcolor.aqua, offset: Offset(10, 10), blurRadius: 15)
//           ]),
//       child: CurvedNavigationBar(
//         buttonBackgroundColor: Colors.transparent,
//         // buttonBackgroundColor: Appcolor.aqua,
//         //  maxWidth: 24,
//         //  backgroundColor:
//         animationCurve: Curves.easeInOut,
//         // animationDuration: Duration(microseconds: 300),
//         //  color: Appcolor.aqua,
//         items: items,
//         height: 72,
//         onTap: (Value) {},
//       ),
//     );
//   }
// }
