import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart'
    show GetBuilder;
import 'package:get/route_manager.dart';
import 'package:tasawoqi/controller/home/timerange_controller.dart';

Widget buildTimeRangePicker() {
  return GetBuilder<TimeRangeController>(
    init: TimeRangeController(),
    builder: (controller) {
      return Material(
        color: Colors.white,
        elevation: 3,
        shadowColor: Colors.black26.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color.fromARGB(255, 225, 224, 224)),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => controller.pickStartTime(Get.context!),
                  child: Text(
                    controller.formatTime(controller.startTime),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const Icon(Icons.arrow_back_ios, size: 24, color: Colors.grey),
              Expanded(
                child: InkWell(
                  onTap: () => controller.pickEndTime(Get.context!),
                  child: Text(
                    controller.formatTime(controller.endTime),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
