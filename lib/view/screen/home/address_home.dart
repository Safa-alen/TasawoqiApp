// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/address/build_address_card.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

import '../../../controller/home/payment_controller.dart';

class AddressHome extends StatelessWidget {
  AddressHome({super.key});

  final TextEditingController homeController = TextEditingController();
  final TextEditingController officeController = TextEditingController();

  final FocusNode homeFocusNode = FocusNode();
  final FocusNode officeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: TitleOnly(title: "عناويني"),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: GetBuilder<PaymentController>(
            builder: (_) => ListView(
              children: [
                const SizedBox(height: 12),
                buildAddressCard(
                  context: context,
                  title: "منزل",
                controller: controller,
                  selectedValue: 'home',
                  focusNode: homeFocusNode,
                  textController: homeController,
                  hintText:
                      "+971 123 456 789\nمعرة مصرين, شارع الجميل, جانب حلويات الاحمد, الطابق الثالث",
                onChanged: (val) {},
  useRadio: false,
                ),
                const SizedBox(height: 16),
                buildAddressCard(
                  context: context,
                  title: "مكتب",
                  controller: controller,
                  selectedValue: 'office',
                  focusNode: officeFocusNode,
                  textController: officeController,
                  hintText:
                      "+971 987 654 321\nعنوان المكتب, شارع التجاري, الطابق الثاني",
                  onChanged: (val) {},
  useRadio: false,
                ),
                const SizedBox(height: 236),
                Buttom(
                  text: "اضافة عنوان جديد",
                  onPressed: () {
                    Get.toNamed(AppRoute.addAddressHome);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
