import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';

import 'package:tasawoqi/view/widget/auth/logoauth.dart';
import 'package:tasawoqi/view/widget/buttom.dart';

import '../../widget/auth/authtext.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(child: Logoauth()),
        const SizedBox(height: 20),
        AuthText(
          title: 'المدينة ',
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        AuthText(
          title: ' يمكنك تغيير موقعك في اي وقت تريده   ',
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
        SizedBox(
          height: 64,
        ),
        Container(
          child: TextFormField(
            readOnly: true,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'المدينة',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                  ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 225, 224, 224)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  AppImagess.icon1,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 136,
        ),
        Container(
          child: Buttom(
            text: "متابعة",
            onPressed: () {
              Get.toNamed(AppRoute.Homepage);
            },
          ),
        )
      ]),
    ));
  }
}
