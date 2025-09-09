import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasawoqi/controller/home/notification_controller.dart';
import 'package:tasawoqi/core/constant/color.dart';

class NotificationsHome extends StatelessWidget {
  final NotificationController controller = Get.find<NotificationController>();

  // مؤقتاً قائمة بيانات ثابتة
  final List<Map<String, dynamic>> notifications = [
    {
      "date": "اليوم 2 تموز 2024",
      "items": [
        {
          "title": "لقد وصل طلبك من سوبر ماركت العائلة",
          "subtitle": "يتم التحضير وسيصل في أقرب وقت",
          "time": "20 دقيقة",
          "image": "https://cdn-icons-png.flaticon.com/512/1046/1046784.png"
        },
        {
          "title": "تم استلام دفعتك بنجاح",
          "subtitle": "قيمة 50,000 ل.س",
          "time": "قبل ساعة",
          "image": "https://cdn-icons-png.flaticon.com/512/1828/1828884.png"
        },
      ],
    },
    {
      "date": "1 تموز 2024",
      "items": [
        {
          "title": "تم شحن طلبك من متجر الإلكترونيات",
          "subtitle": "سيصل خلال 3 أيام عمل",
          "time": "10 ساعات",
          "image": "https://cdn-icons-png.flaticon.com/512/2920/2920349.png"
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
            title: Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text("الإشعارات"))),
        body: GetBuilder<NotificationController>(
          builder: (_) {
            if (notifications.isEmpty) {
              return Center(
                  child: Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text("لا يوجد إشعارات حالياً")));
            }

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final section = notifications[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 24.0, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // التاريخ
                      Text(
                        section["date"],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.aqua),
                      ),
                      // الإشعارات تحت نفس التاريخ
                      ...List.generate((section["items"] as List).length, (i) {
                        final item = section["items"][i];
                        return Card(
                          color: Appcolor.white,
                          //  margin:
                          //    EdgeInsets.only(right: 24, left: 24, bottom: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // زر الحذف (X)
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.grey),
                                  onPressed: () {
                                    controller.removeNotification(
                                        notifications, index, i);
                                  },
                                ),
                                SizedBox(width: 12),
                                // النصوص
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item["title"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Appcolor.myGrey),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        item["subtitle"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Appcolor.myGrey),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        item["time"],
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 197, 196, 196),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // صورة
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(item["image"]),
                                    radius: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      if (index != notifications.length - 1)
                        SizedBox(height: 32),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
