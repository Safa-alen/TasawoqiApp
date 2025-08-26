import 'package:get/get.dart';

class NotificationController extends GetxController {
  void removeNotification(List sections, int sectionIndex, int itemIndex) {
    sections[sectionIndex]["items"].removeAt(itemIndex);
    if ((sections[sectionIndex]["items"] as List).isEmpty) {
      sections.removeAt(sectionIndex);
    }
    update();
  }
}
