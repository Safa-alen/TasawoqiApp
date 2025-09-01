// التاب

import 'package:flutter/material.dart';

import 'package:tasawoqi/controller/home/order_controller.dart'
    show OrderController;

import '../../../core/constant/color.dart';

class TabOrder extends StatelessWidget {
  final OrderController orderCtrl;
  const TabOrder({required this.orderCtrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(height: 1, color: Colors.grey.shade300),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTab("الطلبات السابقة", 0),
            _buildTab("الطلبات الحالية", 1),
          ],
        ),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = orderCtrl.selectedIndex == index;
    return InkWell(
      onTap: () => orderCtrl.changeTab(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Appcolor.aqua : Appcolor.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 150,
              color: Appcolor.aqua,
            ),
        ],
      ),
    );
  }
}
