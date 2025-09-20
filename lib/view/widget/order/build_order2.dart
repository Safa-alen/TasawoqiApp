import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';
import 'package:tasawoqi/view/widget/detalis/counter.dart';

class BuildOrder2 extends StatelessWidget {
  final Map<String, dynamic> product; // ✅ الآن Map
  const BuildOrder2({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 57,
        //  bottom: 10,
      ),
      child: SizedBox(
        height: 160,
        child: Stack(
          clipBehavior: Clip.none, // 👈 يسمح للصورة تطلع برا
          children: [
            // الكرت الكبير
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(
                    right: 100, left: 16, top: 16, bottom: 16), // مكان للصورة
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            product["title2"] ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const Text(" / "),
                        Text(
                          product["title1"] ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${product["price"]}",
                      style: TextStyle(
                        color: Appcolor.aqua,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Counter(),
                  ],
                ),
              ),
            ),

            // 👈 الصورة (نصها برا الكرت)
            Positioned(
              right: -30, // تطلع شوي لبرا
              top: 30,
              bottom: 30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(product["image"] ?? ""),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
