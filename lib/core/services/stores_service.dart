import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasawoqi/data/model/recomm_stores_modle.dart';

class StoresService {
  static const String baseUrl =
      "https://example.com/api"; // ✨ غيريها للـ API تبعك

  static Future<List<RecommstoresModle>> fetchStores() async {
    final response = await http.get(Uri.parse("$baseUrl/stores"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // إذا الرد Map فيه مفتاح data
      final List data =
          body is Map<String, dynamic> ? body['data'] ?? [] : body;

      return data.map((json) => RecommstoresModle.fromJson(json)).toList();
    } else {
      throw Exception("❌ فشل في جلب بيانات المتاجر: ${response.statusCode}");
    }
  }
}
