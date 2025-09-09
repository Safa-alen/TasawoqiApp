import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasawoqi/core/constant/color.dart' show Appcolor;
import 'package:tasawoqi/core/constant/route.dart';
import 'package:tasawoqi/view/widget/buttom.dart' show Buttom;
import 'package:tasawoqi/view/widget/panel/store_cardpanel.dart'
    show StoreCardpanel;

import '../../../core/constant/imagess.dart' show AppImagess;

class StoreInfopanel extends StatelessWidget {
  const StoreInfopanel({super.key});

  @override
  Widget build(BuildContext context) {
    bool storeOpen = true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('مزارعنا',
              style: TextStyle(fontSize: 20, color: Appcolor.black)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 4),
              const Text('  عنوان المتجر',
                  style: TextStyle(color: Colors.grey)),
              SvgPicture.asset(
                AppImagess.icon19,
                color: Appcolor.grey,
              )
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 4),
              Text('أوقات الدوام: 09:00 ص - 10:00 م',
                  style: TextStyle(color: Colors.grey)),
              Icon(Icons.access_time, size: 16, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'وصف قصير للمتجر هنا...وصف قصير للمتجر هنا...',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          // Switch حالة المتجر
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('حالة المتجر (مفتوح)',
                  style: TextStyle(fontSize: 16, color: Appcolor.black)),
              Switch(
                value: storeOpen,
                onChanged: (val) {},
                thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white;
                    }
                    return Colors.grey;
                  },
                ),
                trackColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return Appcolor.aqua;
                    }
                    return Colors.grey.shade300;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // الأزرار
          const Column(
            children: [
              StoreCardpanel('المنتجات', 20, AppRoute.productPanelHome),
              StoreCardpanel('الطلبات', 3, AppRoute.orderpanelHome),
              StoreCardpanel('الرصيد', 43, AppRoute.balancepanelHome),
            ],
          ),
          const SizedBox(height: 24),
          const Buttom(text: "عرض متجري كزائر  "),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}
