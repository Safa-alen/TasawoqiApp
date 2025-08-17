import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1️⃣ Controller
class PaymentController extends GetxController {
  String selectedOption1 = ''; // 'home' أو 'office'
  String homeNote = '';
  String officeNote = '';
  String selectedOption2 = '';

  void selectOption1(String option) {
    selectedOption1 = option;
    update();
  }

  void selectOption2(String option) {
    selectedOption2 = option;
    update();
  }

  void updateHomeNote(String value) {
    homeNote = value;
    update();
  }

  void updateOfficeNote(String value) {
    officeNote = value;
    update();
  }
}
