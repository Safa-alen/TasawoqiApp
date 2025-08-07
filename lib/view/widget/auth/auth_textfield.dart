import 'package:flutter/material.dart';

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
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: TextFormField(
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
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
