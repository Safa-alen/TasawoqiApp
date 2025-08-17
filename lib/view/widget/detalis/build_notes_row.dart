import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildNotesField() {
  return Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1)
      ],
    ),
    child: const TextField(
      cursorHeight: 18,
      cursorWidth: 2,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        border: InputBorder.none,
      ),
    ),
  );
}
