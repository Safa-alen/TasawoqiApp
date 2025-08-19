import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tasawoqi/controller/home/Personal_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/screen/home/address_home.dart';
import 'package:tasawoqi/view/widget/auth/logoauth.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/screen/home/address_home.dart';

import '../../screen/home/address_home.dart';

// هذا AppBar مع زر يفتح Drawer
class appbar_home extends StatelessWidget implements PreferredSizeWidget {
  const appbar_home({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Logoauth(),
            Builder(
              builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer(); // يفتح الـDrawer
                  },
                  child: SvgPicture.asset(AppImagess.icon4),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              GetBuilder<PersonalController>(
                builder: (controller) => ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    controller.profileImage,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TitleOnly(title: "الاسم الثلاثي"),
              Text(
                "example@gmail.com",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Appcolor.medigrey, fontSize: 16),
              ),
              SizedBox(
                height: 56,
              )
            ],
          ),
          ListTileWidget(
            icon: SvgPicture.asset(AppImagess.icon15),
            text: 'لوحة التحكم',
          ),
          ListTileWidget(
            icon: SvgPicture.asset(
              AppImagess.icon6,
              color: Appcolor.black,
            ),
            text: ' المتاجر',
          ),
          ListTileWidget(
            icon: SvgPicture.asset(AppImagess.icon16),
            text: 'طلباتي ',
          ),
          ListTileWidget(
            icon: SvgPicture.asset(AppImagess.icon17),
            text: 'الاشعارات ',
          ),
          ListTileWidget(
            icon: SvgPicture.asset(AppImagess.icon18),
            text: 'نقاطي ',
          ),
          ListTileWidget(
            icon: SvgPicture.asset(AppImagess.icon19),
            text: 'عناويني ',
            onTap: () {
              Get.toNamed(AppRoute.addressHome);
            },
          ),
          ListTileWidget(
            icon: Icon(Icons.favorite_border_outlined),
            text: 'المفضلة ',
            onTap: () {
              Get.toNamed(AppRoute.favoriteHome);
            },
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16, left: 66),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(AppImagess.icon11),
                SvgPicture.asset(AppImagess.icon13),
                SvgPicture.asset(AppImagess.icon13),
                SvgPicture.asset(AppImagess.icon14),
              ],
            ),
          ),
          SizedBox(
            height: 55,
          ),
          ListTile(
              leading: Icon(Icons.logout),
              iconColor: Appcolor.black,
              title: Text("تسجيل الخروج",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16, color: Appcolor.medigrey)),
              onTap: () {})
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final Widget icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      iconColor: Appcolor.black,
      title: Text(text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16)),
      onTap: onTap,
    );
  }
}
