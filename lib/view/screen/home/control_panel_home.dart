import 'package:flutter/material.dart';

import 'package:tasawoqi/view/widget/panel/store_Imagepanel.dart';
import 'package:tasawoqi/view/widget/panel/store_Infopanel.dart';

class ControlPanelHome extends StatelessWidget {
  const ControlPanelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 24.0, left: 24, top: 24),
        child: Column(
          children: [
            StoreImagepanel(),
            SizedBox(height: 16),
            StoreInfopanel(),
          ],
        ),
      ),
    );
  }
}
