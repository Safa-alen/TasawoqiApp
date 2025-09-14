// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:tasawoqi/data/model/recomm_stores_modle.dart';

// class RecommStoresController extends GetxController {
//   List<RecommstoresModle> stores = [];
//   bool isLoading = false;

//   // 🔥 دالة تجيب البيانات من الـ API
//   Future<void> fetchStores() async {
//     try {
//       isLoading = true;
//       update();

//       final response = await http.get(
//         Uri.parse("https://yourapi.com/recommstores"), // حطي رابط API الحقيقي
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);

//         stores = data.map((e) => RecommstoresModle.fromJson(e)).toList();
//       } else {
//         print("❌ خطأ في جلب البيانات: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("⚠️ استثناء: $e");
//     } finally {
//       isLoading = false;
//       update(); // تحديث الواجهة
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     fetchStores(); // تشغيل الجلب أول ما يشتغل الكونترولر
//   }
// }
import 'package:get/get.dart';
import 'package:tasawoqi/data/datasource/static/recommstore.dart';
import 'package:tasawoqi/data/model/recomm_stores_modle.dart';

class StoresController extends GetxController {
  List<RecommstoresModle> stores = [];

  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchStores();
  }

  // 🔹 مؤقتاً من الملف static
  void fetchStores() async {
    try {
      isLoading = true;
      update(); // 🔹 يخلي الـ GetBuilder يعيد بناء الواجهة

      await Future.delayed(const Duration(seconds: 1)); // محاكاة تأخير API

      stores = Recommstores; // البيانات من الملف static
    } catch (e) {
      stores = [];
      print("❌ خطأ في جلب المتاجر: $e");
    } finally {
      isLoading = false;
      update(); // 🔹 إعادة بناء الواجهة بعد انتهاء التحميل
    }
  }
}
