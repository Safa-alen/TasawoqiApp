import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';

class ButtomNaviBar extends StatelessWidget {
  const ButtomNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              extendBody: true,

              floatingActionButton: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: Appcolor.aqua,
                  onPressed: () {
                    controller.changPage(2);
                  },
                  child: SvgPicture.asset(
                    AppImagess.icon7,
                    color: Colors.white,
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              //  floatingActionButton: SizedBox(
              //       height: 60,
              //       width: 60,
              //       child: FloatingActionButton(
              //         shape: const CircleBorder(),
              //         backgroundColor: Appcolor.aqua,)),

              bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 10,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            controller.changPage(0);
                          },
                          child: SvgPicture.asset(AppImagess.icon8,
                              color: Appcolor.medigrey),
                        ),
                        MaterialButton(
                          onPressed: () {
                            controller.changPage(1);
                          },
                          child: Icon(
                            Icons.color_lens_outlined,
                            color: Appcolor.medigrey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            controller.changPage(3);
                          },
                          child: SvgPicture.asset(AppImagess.icon6,
                              color: Appcolor.medigrey),
                        ),
                        MaterialButton(
                          onPressed: () {
                            controller.changPage(4);
                          },
                          child: SvgPicture.asset(AppImagess.icon9,
                              color: Appcolor.medigrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              body: controller.listpage.elementAt(controller.currentpage),
            ));
  }
}
