// صورة المتجر
import 'package:flutter/widgets.dart'
    show
        StatelessWidget,
        BorderRadius,
        BuildContext,
        Widget,
        Image,
        BoxFit,
        ClipRRect,
        Container;
import 'package:tasawoqi/core/constant/imagess.dart';

class StoreImagepanel extends StatelessWidget {
  const StoreImagepanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 312,
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          AppImagess.reco1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
