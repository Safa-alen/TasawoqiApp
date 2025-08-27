import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';

class ProfileImageWidget extends StatelessWidget {
  final GetxController controller;
  final String type; // 'merchant' أو 'product'
  final double height;
  final double width;
  final bool allowPickImage;

  const ProfileImageWidget({
    super.key,
    required this.controller,
    this.type = 'merchant',
    this.height = 200,
    this.width = double.infinity,
    this.allowPickImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxController>(
      init: controller,
      builder: (ctrl) {
        File? imageFile;
        if (type == 'merchant') {
          imageFile = (ctrl as MerchantImageController).profileImage;
        } else if (type == 'product') {
          imageFile = (ctrl as ProductPanelController).productImage;
        }

        return Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imageFile != null
                      ? Image.file(
                          imageFile,
                          height: height,
                          width: width,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: height,
                          width: width,
                          color: Colors.grey.shade300,
                          child: Icon(
                            type == 'merchant' ? Icons.store : Icons.image,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                ),
                // قلم التاجر فقط
                if (allowPickImage && type == 'merchant')
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () async {
                        await Get.bottomSheet(
                          Container(
                            color: Colors.white,
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('الكاميرا'),
                                  onTap: () async {
                                    Get.back();
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    (ctrl as MerchantImageController)
                                        .pickImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text('الاستوديو'),
                                  onTap: () async {
                                    Get.back();
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    (ctrl as MerchantImageController)
                                        .pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppImagess.icon22,
                            color: Appcolor.aqua),
                      ),
                    ),
                  ),
              ],
            ),
            // نص إضافة صورة للمنتج فقط
            if (type == 'product' && allowPickImage) const SizedBox(height: 8),
            if (type == 'product' && allowPickImage)
              InkWell(
                onTap: () async {
                  final ctrlC = ctrl as ProductPanelController;
                  ctrlC.isSelected = true; // فور الضغط يتحول اللون
                  ctrlC.update();
                  await ctrlC.pickImageFromGallery(); // بعدين تختارين الصورة
                  // (ctrl as ProductImageController).pickImageFromGallery();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      " إضافة صورة أخرى ",
                      style: TextStyle(
                        color: (ctrl as ProductPanelController).isSelected
                            ? Appcolor.aqua
                            : Appcolor.lightGrey,
                        fontSize: 14,
                        //  decoration: TextDecoration.underline,
                      ),
                    ),
                    //   const SizedBox(width: 5),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: (ctrl as ProductPanelController).isSelected
                              ? Appcolor.aqua
                              : Appcolor.lightGrey
                          //   borderRadius: BorderRadius.circular(5),
                          ),
                      child:
                          const Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
