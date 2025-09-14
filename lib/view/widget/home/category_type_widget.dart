import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/cart_controller.dart';
import 'package:tasawoqi/controller/home/favorite_controller.dart';
import 'package:tasawoqi/controller/home/home_screen_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/data/model/category_modle.dart';
import 'package:tasawoqi/data/model/offers_modle.dart';
import 'package:tasawoqi/view/screen/home/product_details.dart';

class CategoryTypeWidget extends StatelessWidget {
  final String image;
  final String title1;
  final String title2;
  final dynamic title3;
  final int index;

  const CategoryTypeWidget({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final favController = Get.find<FavoriteController>();
    final cartController = Get.find<CartController>();

    final product = ObjctModle(
      id: index.toString(),
      title1: title1,
      title2: title2,
      title3: double.tryParse(title3.toString()) ?? 0,
      title4: '',
      Image: image,
      point: '',
    );

    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetails(), arguments: product);
      },
      child: Align(
        alignment: Alignment.centerRight, // 🔥 خلي الكرت عاليمين
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildImage(),
                  _buildTexts(context),
                  const SizedBox(height: 10),
                  _buildAddButton(context, product),
                ],
              ),
              _buildFavoriteIcon(favController),
            ],
          ),
        ),
      ),
    );
  }

  /// صورة المنتج
  Widget _buildImage() {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  /// النصوص (العناوين + السعر)
  Widget _buildTexts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title1, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          Text(
            title2,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            title3.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontFamily: 'Poppins',
                  color: Appcolor.aqua,
                ),
          ),
        ],
      ),
    );
  }

  /// زر الإضافة إلى السلة
  Widget _buildAddButton(BuildContext context, ObjctModle product) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 30,
          width: 150,
          decoration: BoxDecoration(
            color: Appcolor.aqua,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            padding: EdgeInsets.zero,
            onPressed: () {
              final homeController = Get.find<HomeScreenControllerImp>();
              homeController.addProductToCart(product);

              Get.snackbar(
                'تمت الإضافة',
                '$title1 تم إضافته إلى السلة',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Appcolor.aqua,
                colorText: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }

  /// أيقونة المفضلة
  Widget _buildFavoriteIcon(FavoriteController favController) {
    return Positioned(
      top: 4,
      right: 4,
      child: GetBuilder<FavoriteController>(
        builder: (_) {
          final isFav = favController.isFavorite(index);
          return GestureDetector(
            onTap: () => favController.toggleFavorite(index),
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.white,
              size: 25,
            ),
          );
        },
      ),
    );
  }
}
