import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/auth/textfield_location.dart';
import 'package:tasawoqi/view/widget/buttom.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';
import 'package:tasawoqi/view/widget/merchant/profile_Image_widget.dart';
import 'package:tasawoqi/view/widget/panel/divider_widget.dart';
import 'package:tasawoqi/view/widget/panel/option_selector_widget.dart';
import 'package:tasawoqi/view/widget/panel/switch_color.dart';
import 'package:tasawoqi/view/widget/panel/switch_discount.dart';
import 'package:tasawoqi/view/widget/panel/switch_size.dart';
import '../../../core/constant/color.dart' show Appcolor;

class AddProductPanel extends StatelessWidget {
  AddProductPanel({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductPanelController>();
    final args = Get.arguments as Map<String, dynamic>?;
    final bool isEditing = args != null;
    final int? editIndex = args?['index'];

    if (isEditing) {
      nameController.text = args['name'] ?? '';
      descriptionController.text = args['description'] ?? '';
      priceController.text = args['price'] ?? '';
      controller.productImage = args['image'];
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: AlignmentGeometry.centerRight,
            child: TitleOnly(title: "إضافة منتج"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24, top: 24),
          child: ListView(
            children: [
              ProfileImageWidget(
                controller: controller,
                type: 'product',
              ),
              const SizedBox(height: 16),
              GetBuilder<ProductPanelController>(
                builder: (controller) {
                  return OptionSelectorWidget(
                    title: "وحدة قياس",
                    options: ["كمية وسعر", "قطعة"],
                    selectedValue: controller.selectedUnit1,
                    onChanged: (value) => controller.selectUnit1(value),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextfieldLocation(
                hinttext: "اسم المنتج",
                controller: nameController,
              ),
              const SizedBox(height: 16),
              TextfieldLocation(
                controller: categoryController,
                hinttext: "الفئة ",
                icon: AppImagess.icon1,
              ),
              const SizedBox(height: 16),
              TextfieldLocation(
                controller: descriptionController,
                hinttext: "الوصف ",
                verticalPadding: 112,
              ),
              const SizedBox(height: 16),
              TextfieldLocation(
                controller: quantityController,
                hinttext: "أقل كمية ",
              ),
              const SizedBox(height: 16),
              TextfieldLocation(
                controller: priceController,
                hinttext: "السعر ",
              ),
              const SizedBox(height: 16),
              GetBuilder<ProductPanelController>(
                builder: (controller) {
                  return OptionSelectorWidget(
                    title: "العملة",
                    options: ["دولار", "تركي"],
                    selectedValue: controller.selectedUnit2,
                    onChanged: (value) => controller.selectUnit2(value),
                  );
                },
              ),
              const SizedBox(height: 16),
              SwitchDiscount(),
              const SizedBox(height: 5),
              DividerWidget(),
              const SizedBox(height: 5),
              SwitchColor(),
              DividerWidget(),
              SwitchSize(),
              const SizedBox(height: 10),
              DividerWidget(),
              GetBuilder<ProductPanelController>(
                builder: (controller) {
                  return OptionSelectorWidget(
                    title: "",
                    options: ["لاشيئ", "ولادي", "رجالي", "نسائي"],
                    selectedValue: controller.selectedUnit3,
                    onChanged: (value) => controller.selectUnit3(value),
                  );
                },
              ),
              const SizedBox(height: 40),
              Buttom(
                text: isEditing ? "تعديل المنتج" : "إضافة منتج",
                onPressed: () {
                  final productName = nameController.text;
                  final description = descriptionController.text;
                  final price = priceController.text;
                  final image = controller.productImage;

                  if (productName.isEmpty ||
                      description.isEmpty ||
                      price.isEmpty ||
                      image == null) {
                    Get.snackbar(
                      "خطأ",
                      "الرجاء إدخال الاسم، الوصف، السعر واختيار صورة",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  final newProduct = {
                    'name': productName,
                    'description': description,
                    'price': price,
                    'image': image,
                  };

                  if (isEditing && editIndex != null) {
                    controller.editProduct(editIndex, newProduct);
                  } else {
                    controller.addProduct(
                      name: productName,
                      description: description,
                      price: price,
                      image: image,
                    );
                  }

                  Get.back();
                },
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
