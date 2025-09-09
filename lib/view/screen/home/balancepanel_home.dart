import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/view/widget/balance/invoice_card.dart';
import 'package:tasawoqi/view/widget/balance/receipt_card.dart';
import 'package:tasawoqi/view/widget/home/title_only.dart';

class BalancepanelHome extends StatelessWidget {
  const BalancepanelHome({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String title = args["title"];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TitleOnly(title: title),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              InvoiceCard(), //سند ارسال
              SizedBox(height: 16),
              ReceiptCard(), //سند قبض
            ],
          ),
        ),
      ),
    );
  }
}
