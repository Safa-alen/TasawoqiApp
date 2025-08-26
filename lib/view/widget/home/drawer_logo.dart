import 'package:flutter/material.dart' show ListTile, Theme, Drawer, Icons;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/home/Personal_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenControllerImp>(); // ✅

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
            onTap: () {
              controller.changPage(5); // 3 هو index صفحة المتاجر في listpage
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(AppImagess.icon15),
            text: 'لوحة التحكم',
          ),
          ListTileWidget(
            onTap: () {
              controller.changPage(3); // 3 هو index صفحة المتاجر في listpage
              Navigator.of(context).pop(); // غلق Drawer
            },
            icon: SvgPicture.asset(
              AppImagess.icon6,
              color: Appcolor.black,
            ),
            text: ' المتاجر',
          ),
          ListTileWidget(
            onTap: () {
              Get.toNamed(AppRoute.ordersHome);
            },
            icon: SvgPicture.asset(AppImagess.icon16),
            text: 'طلباتي ',
          ),
          ListTileWidget(
            onTap: () {
              Get.toNamed(AppRoute.notificationsHome);
            },
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
          ListTileWidget(
            icon: Icon(Icons.logout),
            text: "تسجيل الخروج",
            iconColor: Appcolor.medigrey, // أيقونة رمادية
            textColor: Appcolor.medigrey, // النص رمادي
            onTap: () {},
          ),
          SizedBox(
            height: 80,
          ),
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
    this.iconColor,
    this.textColor, // أضفنا لون النص اختياري
  });

  final Widget icon;
  final String text;
  final void Function()? onTap;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconTheme(
        data: IconThemeData(color: iconColor ?? Appcolor.black),
        child: icon,
      ),
      title: Text(
        text,
        textAlign: TextAlign.right,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 16, color: textColor ?? Appcolor.black),
      ),
      onTap: onTap,
    );
  }
}
