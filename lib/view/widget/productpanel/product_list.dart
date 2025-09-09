import 'package:flutter/widgets.dart'
    show
        StatelessWidget,
        BouncingScrollPhysics,
        BuildContext,
        Widget,
        ListView,
        SizedBox;
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tasawoqi/controller/home/productpanel_controller.dart';
import 'package:tasawoqi/view/widget/productpanel/cart_panel_product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPanelController>(
      builder: (controller) {
        final productsToShow = controller.selectedOption.isEmpty ||
                controller.selectedOption == 'لاشيئ'
            ? controller.addedProducts
            : controller.filteredProducts;

        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: productsToShow.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return CartPanelProduct(
              product: productsToShow[index],
              index: index,
            );
          },
        );
      },
    );
  }
}
