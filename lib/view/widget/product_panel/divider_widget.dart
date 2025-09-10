import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Appcolor.switchcolor, // لون الخط
      thickness: 0.5, // سمك الخط
      height: 20, // المسافة العمودية حول الخط
      indent: 0, // بداية الخط من اليسار
      endIndent: 0, // نهاية الخط على اليمين
    );
  }
}
