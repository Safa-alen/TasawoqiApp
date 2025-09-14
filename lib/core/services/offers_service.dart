import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasawoqi/data/model/offers_modle.dart';

class OffersService {
  static const String baseUrl = "https://example.com/api"; // ✨ غيريها

  static Future<List<OffersModle>> fetchOffers() async {
    final response = await http.get(Uri.parse("$baseUrl/offers"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // إذا الرد Map فيه data
      final List data =
          body is Map<String, dynamic> ? body['data'] ?? [] : body;

      return data.map((json) => OffersModle.fromJson(json)).toList();
    } else {
      throw Exception("❌ فشل في جلب البيانات: ${response.statusCode}");
    }
  }
}

// مثال: http://localhost:8000/api أو https://yourdomain.com/api.

// /offers: هو اسم الـ endpoint. إذا الباك إند عندك مسميه شي تاني (مثلاً /api/v1/offers)، غيريه.

// OffersModle.fromJson: لازم يكون مجهز عندك بالـ model مع fromJson / toJson متل ما عملنا.

// خلي بالك إنو الـ API غالباً بيرجع Map فيه مفتاح data جواته ليست، مو ليست مباشرة.

// مثلاً:
