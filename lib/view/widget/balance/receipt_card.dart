import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2 Apr 2024, 02:00pm",
                          style:
                              TextStyle(color: Appcolor.grey3, fontSize: 13)),
                      Text("#1123رقم القيد",
                          style: TextStyle(
                              color: Appcolor.lightGrey, fontSize: 13)),
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
                      Center(
                        child: Container(
                          height: 35,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Appcolor.grey, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              "\$500",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.blacktext,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(color: Colors.grey.shade300),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "لقد قبضت خمسمائة دولار فقط لا غير",
                        style:
                            TextStyle(color: Appcolor.lightGrey, fontSize: 14),
                      ),
                      Text(
                        ":وذلك لقاء",
                        style:
                            TextStyle(color: Appcolor.lightGrey, fontSize: 12),
                      ),
                    ],
                  )
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
              color: Appcolor.yellow,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'سند قبض',
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
