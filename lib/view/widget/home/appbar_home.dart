import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';

class appbar_home extends StatelessWidget implements PreferredSizeWidget {
  const appbar_home({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false, // عشان ما يضيف زر افتراضي
      title: Padding(
          padding: const EdgeInsets.only(
              right: 15.0, top: 15), // إبعاده شوي عن الحافة
          child: Logoauth() // زر القائمة على اليسار
          ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SvgPicture.asset(AppImagess.icon4),
        ),
      ],
    );
  }
}
