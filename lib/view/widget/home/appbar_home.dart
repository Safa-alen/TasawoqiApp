// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:tasawoqi/controller/home/Personal_controller.dart';
// import 'package:tasawoqi/controller/home/home_screen_controller.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart';
// import 'package:tasawoqi/core/constant/route.dart';
// import 'package:tasawoqi/view/screen/home/address_home.dart';
// import 'package:tasawoqi/view/widget/auth/logoauth.dart';
// import 'package:tasawoqi/view/widget/home/title_only.dart';
// import 'package:tasawoqi/view/screen/home/address_home.dart';

// import '../../screen/home/address_home.dart';

// // هذا AppBar مع زر يفتح Drawer
// class appbar_home extends StatelessWidget implements PreferredSizeWidget {
//   const appbar_home({super.key});

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(

//       automaticallyImplyLeading: false,
//       title: Padding(
//         padding: const EdgeInsets.only(
//           top: 24.0,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Builder(
//               builder: (context) {
//                 return InkWell(
//                   onTap: () {
//                     Scaffold.of(context).openDrawer(); // يفتح الـDrawer
//                   },
//                   child: SvgPicture.asset(AppImagess.icon4),
//                 );
//               },
//             ),
//             const Logoauth(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';

class appbar_home extends StatelessWidget implements PreferredSizeWidget {
  const appbar_home({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context)
                        .openDrawer(); // يفتح Drawer من Scaffold الموجود بالصفحة
                  },
                  child: SvgPicture.asset(AppImagess.icon4),
                );
              },
            ),
            const Logoauth(),
          ],
        ),
      ),
    );
  }
}
