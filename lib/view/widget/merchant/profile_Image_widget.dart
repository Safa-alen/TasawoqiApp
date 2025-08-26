// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:tasawoqi/controller/home/merchant_controller.dart';
// import 'package:tasawoqi/core/constant/color.dart';
// import 'package:tasawoqi/core/constant/imagess.dart' show AppImagess;

// Widget buildProfileImage() {
//   return GetBuilder<MerchantController>(
//     init: MerchantController(),
//     builder: (controller) => Stack(
//       alignment: Alignment.topRight,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: controller.profileImage == null
//               ? Container(
//                   height: 312,
//                   width: 400,
//                   color: Colors.grey.shade200,
//                   child: const Icon(Icons.store, size: 100, color: Colors.grey),
//                 )
//               : (controller.profileImage!.startsWith('assets/')
//                   ? Image.asset(
//                       controller.profileImage!,
//                       height: 312,
//                       width: 400,
//                       fit: BoxFit.cover,
//                     )
//                   : Image.file(
//                       File(controller.profileImage!),
//                       height: 312,
//                       width: 312,
//                       fit: BoxFit.cover,
//                     )),
//         ),
//         Positioned(
//           top: 15,
//           right: 15,
//           child: InkWell(
//             onTap: () {
//               Get.bottomSheet(
//                 Container(
//                   color: Colors.white,
//                   child: Wrap(
//                     children: [
//                       ListTile(
//                         leading: const Icon(Icons.camera_alt),
//                         title: const Text('الكاميرا',
//                             style: TextStyle(fontSize: 18)),
//                         onTap: () {
//                           controller.pickImageFromCamera();
//                           Get.back();
//                         },
//                       ),
//                       ListTile(
//                         leading: const Icon(Icons.photo_library),
//                         title: const Text('الاستوديو',
//                             style: TextStyle(fontSize: 18)),
//                         onTap: () {
//                           controller.pickImageFromGallery();
//                           Get.back();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: Colors.white),
//               padding: const EdgeInsets.all(6),
//               child: SvgPicture.asset(AppImagess.icon22, color: Appcolor.aqua),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasawoqi/controller/home/merchant_controller.dart';
import 'package:tasawoqi/controller/home/productImage_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/core/constant/imagess.dart' show AppImagess;

// Controller لكل صورة (التاجر أو المنتج)
class ProfileImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool allowPickImage;
  final GetxController controller;
  final String type; // 'merchant' أو 'product'

  const ProfileImageWidget({
    super.key,
    required this.controller,
    this.type = 'merchant',
    this.height = 312,
    this.width = 400,
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
          imageFile = (ctrl as ProductImageController).productImage;
        }

        return Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
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
                      child: const Icon(
                        Icons.store,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
            ),
            if (allowPickImage)
              Positioned(
                top: 15,
                right: 15,
                child: InkWell(
                  onTap: () async {
                    await Get.bottomSheet(
                      Container(
                        color: Colors.white,
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('الكاميرا',
                                  style: TextStyle(fontSize: 18)),
                              onTap: () async {
                                Get.back();
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                if (type == 'merchant') {
                                  (ctrl as MerchantImageController)
                                      .pickImage(ImageSource.camera);
                                } else {
                                  (ctrl as ProductImageController)
                                      .pickImageFromCamera();
                                }
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('الاستوديو',
                                  style: TextStyle(fontSize: 18)),
                              onTap: () async {
                                Get.back();
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                if (type == 'merchant') {
                                  (ctrl as MerchantImageController)
                                      .pickImage(ImageSource.gallery);
                                } else {
                                  (ctrl as ProductImageController)
                                      .pickImageFromGallery();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(AppImagess.icon22,
                        color: Appcolor.aqua),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
