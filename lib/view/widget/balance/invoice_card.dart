import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/logo.png", height: 20),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2 Apr 2024, 02:00pm",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("#1123رقم القيد",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("سوبر ماركت العائلة",
                          style:
                              TextStyle(color: Appcolor.black, fontSize: 14)),
                      Text("اسم المستلم ",
                          style:
                              TextStyle(color: Appcolor.black, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  أحمد أحمد",
                          style:
                              TextStyle(color: Appcolor.black, fontSize: 14)),
                      Text(" استلمت من السيد ",
                          style:
                              TextStyle(color: Appcolor.black, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("السعر",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 28),
                              Text("العدد",
                                  style: TextStyle(
                                      color: Appcolor.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text("المنتجات",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Appcolor.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("\$200",
                                  style: TextStyle(
                                      color: Appcolor.blacktext, fontSize: 12)),
                              SizedBox(width: 48),
                              Text("1",
                                  style: TextStyle(
                                      color: Appcolor.blacktext, fontSize: 12)),
                            ],
                          ),
                          Text("سائل جلي مدار",
                              style: TextStyle(
                                  color: Appcolor.blacktext, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("\$300",
                                  style: TextStyle(
                                      color: Appcolor.blacktext, fontSize: 12)),
                              SizedBox(width: 48),
                              Text("2",
                                  style: TextStyle(
                                      color: Appcolor.blacktext, fontSize: 12)),
                            ],
                          ),
                          Text("كلور",
                              style: TextStyle(
                                  color: Appcolor.blacktext, fontSize: 12)),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$500",
                              style: TextStyle(
                                  color: Appcolor.black,
                                  fontWeight: FontWeight.bold)),
                          Text("المبلغ الإجمالي",
                              style: TextStyle(
                                  color: Appcolor.black,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Divider(color: Colors.grey.shade300),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text("خمسمائة دولار فقط لا غير",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Appcolor.aqua,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'فاتورة بيع',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
