import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';

import 'package:tasawoqi/view/widget/auth/logoauth.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/buttom.dart';

import '../../widget/auth/authtext.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Center(child: Logoauth()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  AuthText(
                    title: 'المدينة ',
                    style: Theme.of(context).textTheme.titleMedium!,
                  ),
                  AuthText(
                    title: ' يمكنك تغيير موقعك في اي وقت تريده   ',
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  const TextfieldLocation(
                    icon: AppImagess.icon1,
                    hinttext: "المدينة",
                  ),
                  const SizedBox(
                    height: 136,
                  ),
                  Container(
                    child: Buttom(
                      text: "متابعة",
                      onPressed: () {
                        Get.toNamed(AppRoute.verfycode);
                      },
                    ),
                  )
                ]),
          )),
    );
  }
}
