import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tasawoqi/controller/onboarding_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class Custom_Buttom extends GetView<OnBordingControllerImp> {
  const Custom_Buttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: 87,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Appcolor.aqua,
          ),
          child: MaterialButton(
            onPressed: () {
              controller.Naxt();
            },
            child: Text(
              "التالي",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text("تجاهل"),
      ],
    );
  }
}
