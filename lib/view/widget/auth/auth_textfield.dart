import 'package:flutter/material.dart';
import 'package:tasawoqi/core/constant/color.dart';

class AuthTextfield extends StatelessWidget {
  final String hinttext;

  final TextEditingController mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscuretext;
  final void Function()? onTapIcon;
  const AuthTextfield({
    Key? key,
    required this.hinttext,
    required this.mycontroller,
    this.valid,
    required this.isNumber,
    this.obscuretext,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3, // درجة الظل
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        style: TextStyle(color: Appcolor.medigrey, fontSize: 17),
        textAlign: TextAlign.right,
        obscureText: obscuretext == null || obscuretext == false ? false : true,
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
              ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 225, 224, 224)),
          ),
          prefixIcon: onTapIcon != null
              ? IconButton(
                  icon: Icon(
                    obscuretext == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onTapIcon,
                )
              : null,
        ),
      ),
    );
  }
}
