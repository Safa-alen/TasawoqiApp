import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/imagess.dart';

class TextfieldLocation extends StatelessWidget {
  const TextfieldLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3, // درجة الظل
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        readOnly: true,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'المدينة',
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
              ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 225, 224, 224)),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              AppImagess.icon1,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
