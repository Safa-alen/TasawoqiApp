// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:tasawoqi/data/model/offers_modle.dart';

// class OffersController extends GetxController {
//   List<OffersModle> offers = [];
//   bool isLoading = true;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchOffers();
//   }

//   Future<void> fetchOffers() async {
//     try {
//       isLoading = true;
//       update();

//       // 🔹 هون بتحطي لينك الـ API تبعك (مؤقتاً رح نحط لينك تجريبي)
//       final response = await http.get(
//         Uri.parse("https://mocki.io/v1/1b9a4d21-12e1-4a36-a955-bf8a2c40f889"),
//       );

//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);
//         offers = data.map((json) => OffersModle.fromJson(json)).toList();
//       } else {
//         Get.snackbar("خطأ", "فشل في تحميل العروض (${response.statusCode})");
//       }
//     } catch (e) {
//       Get.snackbar("خطأ", "حدث خطأ أثناء تحميل العروض: $e");
//     } finally {
//       isLoading = false;
//       update();
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:tasawoqi/data/datasource/static/offers.dart';
import 'package:tasawoqi/data/model/offers_modle.dart';

class OffersController extends GetxController {
  List<OffersModle> offers = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchOffers();
  }

  void fetchOffers() async {
    await Future.delayed(const Duration(seconds: 1)); // محاكاة API
    offers = Offers; // مؤقتاً جبت البيانات من الملف الثابت
    isLoading = false;
    update();
  }
}
