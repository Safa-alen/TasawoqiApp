import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeRangeController extends GetxController {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> pickStartTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      startTime = picked;
      update(); // تحديث GetBuilder
    }
  }

  Future<void> pickEndTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      endTime = picked;
      update(); // تحديث GetBuilder
    }
  }

  String formatTime(TimeOfDay? time) {
    if (time == null) return "--:--";
    final hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "ص" : "م";
    return "$hour:$minute $period";
  }
}
