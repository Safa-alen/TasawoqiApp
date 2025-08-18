import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
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
              title: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: TitleOnly(
                    title: "عناويني",
                  ),
                ),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24, top: 40),
                child: GetBuilder<PaymentController>(
                    builder: (_) => ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),

                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors
                                            .grey.shade300, // لون فاتح للإطار
                                        width: 1, // سمك الإطار
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.1), // لون الظل وشفافيته
                                          spreadRadius: 5, // مدى انتشار الظل
                                          blurRadius: 15, // مدى تليين الظل
                                          offset:
                                              Offset(0, 4), // موقع الظل (x, y)
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        RadioListTile<String>(
                                          value: 'home',
                                          groupValue:
                                              controller.selectedOption1,
                                          onChanged: (value) {
                                            controller.selectOption1(value!);
                                          },
                                          title: Text(
                                            "منزل",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(fontSize: 15),
                                            textAlign: TextAlign.right,
                                          ),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Appcolor.aqua,
                                        ),
                                        TextField(
                                          focusNode: homeFocusNode,
                                          maxLines: 3,
                                          textAlign: TextAlign.right,
                                          onChanged: controller.updateHomeNote,
                                          enabled: controller.selectedOption1 ==
                                              'home',
                                          decoration: InputDecoration(
                                            hintText:
                                                "+971 123 456 789\n,معرة مصرين, شارع الجميل, جانب حلويات \nالاحمد, الطابق الثالث",
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Appcolor.grey),
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 19),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 15,
                                    child: IconButton(
                                        onPressed: () {
                                          FocusScope.of(context)
                                              .requestFocus(homeFocusNode);
                                        },
                                        icon: SvgPicture.asset(
                                          AppImagess.icon22,
                                          color: Appcolor.grey,
                                        )),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 16,
                              ),

                              // الخيار الثاني: مكت// الخيار الثاني: مكتب
                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors
                                            .grey.shade300, // لون فاتح للإطار
                                        width: 1, // سمك الإطار
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.1), // لون الظل وشفافيته
                                          spreadRadius: 5, // مدى انتشار الظل
                                          blurRadius: 15, // مدى تليين الظل
                                          offset:
                                              Offset(0, 4), // موقع الظل (x, y)
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        RadioListTile<String>(
                                          value: 'office',
                                          groupValue:
                                              controller.selectedOption1,
                                          onChanged: (value) {
                                            controller.selectOption1(value!);
                                          },
                                          title: Text(
                                            "مكتب",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(fontSize: 15),
                                            textAlign: TextAlign
                                                .right, // محاذاة العنوان لليمين
                                          ),
                                          controlAffinity: ListTileControlAffinity
                                              .trailing, // الراديو على اليمين
                                          activeColor: Appcolor.aqua,
                                        ),
                                        TextField(
                                          focusNode: officeFocusNode,
                                          controller: officeController,
                                          maxLines: 3,
                                          textAlign: TextAlign.right,
                                          onChanged:
                                              controller.updateOfficeNote,
                                          enabled: controller.selectedOption1 ==
                                              'office', // ✅ هنا

                                          decoration: InputDecoration(
                                            hintText:
                                                "+971 987 654 321\n,عنوان المكتب, شارع التجاري, الطابق الثاني",
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Appcolor.grey),
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 19),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 25,
                                    left: 25,
                                    child: InkWell(
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(officeFocusNode);
                                        },
                                        child: SvgPicture.asset(
                                          AppImagess.icon22,
                                          color: Appcolor.grey,
                                        )),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 236,
                              ),
                              Buttom(
                                text: "اضافة عنوان جديد",
                                onPressed: () {
                                  Get.toNamed(AppRoute.addAddressHome);
                                },
                              )
                            ])))));
  }
}
