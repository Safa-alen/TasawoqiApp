// الكرت الصغير (المنتجات - الطلبات - الرصيد)
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart' show Get;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tasawoqi/core/constant/color.dart' show Appcolor;

class StoreCardpanel extends StatelessWidget {
  final String title;
  final int count;
  final String route;

  const StoreCardpanel(this.title, this.count, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('($count)',
                style: const TextStyle(color: Colors.teal, fontSize: 18)),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () => Get.toNamed(
              route,
              arguments: {"title": title, "count": count},
            ),
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
