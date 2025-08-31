import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/controller/home/search_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/screen/home/control_panel_home.dart';
import 'package:tasawoqi/view/widget/buttombar/build_navbutton.dart';
import 'package:tasawoqi/view/widget/home/appbar_home.dart';
import 'package:tasawoqi/view/widget/home/drawer_logo.dart';

class ButtomNaviBar extends StatelessWidget {
  const ButtomNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    // تسجيل الكنترولر
    final controller = Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (_) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          // AppBarHome يظهر في كل الصفحات
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: appbar_home(),
          ),
          // Drawer موجود في Scaffold الرئيسي
          drawer: DrawerWidget(
              // منع السحب من اليسار

              // controller: controller
              ),
          // drawerEnableOpenDragGesture: true, // منع السحب من اليسار

          extendBody: true,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Appcolor.aqua,
            onPressed: () => controller.changPage(2),
            child: SvgPicture.asset(
              AppImagess.icon7,
              color: Colors.white,
              height: 28,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: SizedBox(
            height: 88,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // أيقونة البداية على اليمين
                        buildNavButton(
                          icon: SvgPicture.asset(
                            AppImagess.icon9,
                            color: Appcolor.medigrey,
                            height: 26,
                          ),
                          index: 4,
                          controller: controller,
                        ),
                        buildNavButton(
                          icon: SvgPicture.asset(
                            AppImagess.icon6,
                            color: Appcolor.medigrey,
                            height: 26,
                          ),
                          index: 3,
                          controller: controller,
                        ),
                        const SizedBox(width: 60), // مساحة لمكان الـ FAB
                        buildNavButton(
                          icon: Icon(
                            Icons.color_lens_outlined,
                            color: Appcolor.medigrey,
                            size: 26,
                          ),
                          index: 1,
                          controller: controller,
                        ),
                        buildNavButton(
                          icon: SvgPicture.asset(
                            AppImagess.icon8,
                            color: Appcolor.medigrey,
                            height: 26,
                          ),
                          index: 0,
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.currentpage == 2)
                  Positioned(
                    bottom: 25,
                    left: MediaQuery.of(context).size.width / 2 - 5,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        color: Appcolor.aqua,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // عرض الصفحة الحالية من listpage
          body: KeyedSubtree(
            key: ValueKey(controller.currentpage),
            child: controller.listpage[controller.currentpage](),
          ),
        ),
      ),
    );
  }
}
