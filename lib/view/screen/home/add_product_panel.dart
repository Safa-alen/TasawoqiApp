import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/controller/home/productImage_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/merchant/profile_Image_widget.dart';

class AddProductPanel extends StatelessWidget {
  const AddProductPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Align(
                alignment: AlignmentGeometry.centerRight,
                child: TitleOnly(title: "إضافة منتج")),
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 24, top: 24),
            child: ListView(
              children: [
                ProfileImageWidget(
                  controller: ProductImageController(),
                  type: 'product',
                ),
                SizedBox(
                  height: 16,
                ),
                ImageSelectorWidget(),
                SizedBox(
                  height: 16,
                ),
                //    MeasurementScreen(),
                TextfieldLocation(hinttext: "اسم المنتج"),
                SizedBox(
                  height: 16,
                ),
                TextfieldLocation(
                  hinttext: "الفئة ",
                  icon: AppImagess.icon1,
                ),
                SizedBox(
                  height: 16,
                ),
                TextfieldLocation(
                  hinttext: "الوصف ",
                  verticalPadding: 112,
                ),
                SizedBox(
                  height: 16,
                ),
                TextfieldLocation(
                  hinttext: "أقل كمية ",
                ),
                SizedBox(
                  height: 16,
                ),
                TextfieldLocation(
                  hinttext: "السعر ",
                ),
              ],
            ),
          ),
        ));
  }
}

class ImageSelectorWidget extends StatelessWidget {
//  final ProductImageController controller = Get.put(ProductImageController());
  final productimagecontroller = Get.find<ProductImageController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductImageController>(
      builder: (_) {
        return InkWell(
          onTap: productimagecontroller.toggleSelection,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "إضافة صورة أخرى ",
                style: TextStyle(
                    color: productimagecontroller.isSelected
                        ? Appcolor.aqua
                        : Colors.grey[300]),
              ),
              Container(
                width: 25,
                height: 20,
                decoration: BoxDecoration(
                  color: productimagecontroller.isSelected
                      ? Appcolor.aqua
                      : Colors.grey[300],
                  //   borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add, size: 16, color: Appcolor.white),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class MeasurementScreen extends StatelessWidget {
//   final productimagecontroller = Get.find<ProductImageController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('اختيار وحدة القياس')),
//       body: GetBuilder<ProductImageController>(
//         builder: (_) {
//           return Column(
//             children: [
//               ListTile(
//                 title: Text('قطعة'),
//                 leading: Radio<String>(
//                   value: 'قطعة',
//                   groupValue: productimagecontroller.selectedUnit,
//                   fillColor: MaterialStateProperty.resolveWith<Color>(
//                     (states) {
//                       if (productimagecontroller.selectedUnit == 'قطعة') {
//                         return Colors.green; // إذا مختار أخضر
//                       }
//                       return Colors.grey; // إذا غير مختار رمادي
//                     },
//                   ),
//                   onChanged: (value) {
//                     productimagecontroller.changeUnit(value!);
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: Text('كم/سعر'),
//                 leading: Radio<String>(
//                   value: 'كم/سعر',
//                   groupValue: productimagecontroller.selectedUnit,
//                   fillColor: MaterialStateProperty.resolveWith<Color>(
//                     (states) {
//                       if (productimagecontroller.selectedUnit == 'كم/سعر') {
//                         return Colors.green; // إذا مختار أخضر
//                       }
//                       return Colors.grey; // إذا غير مختار رمادي
//                     },
//                   ),
//                   onChanged: (value) {
//                     productimagecontroller.changeUnit(value!);
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                   'الوحدة المختارة: ${productimagecontroller.selectedUnit ?? 'لا شيء'}'),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
