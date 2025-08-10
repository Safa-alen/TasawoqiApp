import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';
import 'package:tasawoqi/view/widget/auth/buttom_navi_bar.dart';
import 'package:tasawoqi/view/widget/home/appbar_home.dart';
import 'package:tasawoqi/view/widget/home/category_best_use.dart';
import 'package:tasawoqi/view/widget/home/ecommstore_list_home.dart';
import 'package:tasawoqi/view/widget/home/row_textbuttom_home.dart';
import 'package:tasawoqi/view/widget/home/search_home.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import '../../widget/home/category_list_home.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Appcolor.aqua, // لون الزر الأوسط
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
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
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
              category_best_use(),
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
