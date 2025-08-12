import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/home_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/view/widget/home/buttom_navi_bar.dart';
import 'package:tasawoqi/view/widget/home/appbar_home.dart';
import 'package:tasawoqi/view/widget/home/category_best_use.dart';
import 'package:tasawoqi/view/widget/home/ecommstore_list_home.dart';
import 'package:tasawoqi/view/widget/home/row_textbuttom_home.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import '../../widget/home/category_list_home.dart';

class Homepage extends GetView<HomeController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Appcolor.aqua,
            onPressed: () {},
            child: SvgPicture.asset(
              AppImagess.icon7,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: buttom_navig_bar(),
        appBar: appbar_home(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: ListView(
            children: [
              search_home(),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: Image.asset(AppImagess.home, fit: BoxFit.cover),
              ),
              const SizedBox(height: 24),
              Row_textbuttom(),
              const SizedBox(height: 10),
              category_list_home(),
              const SizedBox(height: 30),
              TitleOnly(title: "متاجر موصى بها"),
              const SizedBox(height: 16),
              Recommstore_list(),
              const SizedBox(height: 25),
              TitleOnly(title: "المنتجات الأكثر طلبا  "),
              const SizedBox(height: 25),
              category_best_use(
                images: BestCategories.map((e) => e.image).toList(),
                titles1: BestCategories.map((e) => e.title1).toList(),
                titles2: BestCategories.map((e) => e.title2)
                    .toList(), // انتبه هنا اسم الحقل 'titl2' مش 'title2'
                titles3: BestCategories.map((e) => e.title3).toList(),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
