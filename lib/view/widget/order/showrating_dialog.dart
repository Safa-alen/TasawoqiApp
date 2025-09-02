import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';

import 'package:tasawoqi/core/constant/imagess.dart' show AppImagess;
import 'package:tasawoqi/view/widget/buttom.dart' show Buttom;
import 'package:tasawoqi/view/widget/home/title_only.dart';

import '../../../controller/home/rating_order_Controller.dart'
    show RatingController;
import '../../../core/constant/color.dart';

void showRatingDialog(BuildContext context, dynamic order) {
  final RatingController controller = Get.put(RatingController());

  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<RatingController>(
          builder: (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    controller.reset();
                    Get.back();
                  },
                  child: const Icon(Icons.close, size: 24),
                ),
              ),
              const SizedBox(height: 8),
              TitleOnly(title: "تقييم المنتج"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  // نجوم من اليسار لليمين
                  return IconButton(
                    onPressed: () => controller.setStars(index + 1),
                    icon: SvgPicture.asset(
                      index < controller.selectedStars
                          ? AppImagess.icon24 // نجمة ممتلئة
                          : AppImagess.icon23,
                      // نجمة فارغة
                    ),
                  );
                }),
              ),
              Text("رأيك يهمنا"),
              const SizedBox(height: 24),
              Material(
                elevation: 1,
                child: TextField(
                  maxLines: 4,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14, color: Appcolor.grey),
                  decoration: InputDecoration(
                    hintText: "اكتب رأيك ...",
                    hintStyle: TextStyle(fontSize: 14, color: Appcolor.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Buttom(
                text: "إرسال",
                onPressed: () {
                  controller.submitRating(order);
                },
              )
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
