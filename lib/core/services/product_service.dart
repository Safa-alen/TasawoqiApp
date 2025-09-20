import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasawoqi/data/model/category_modle.dart';

class ProductService {
  static const String baseUrl =
      "https://example.com/api"; // 🔥 عدليها حسب الـ API عندك

  /// جميع المنتجات
  static Future<List<ObjctModle>> fetchAllProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final List data =
          body is Map<String, dynamic> ? body['data'] ?? [] : body;

      return data.map((json) => ObjctModle.fromJson(json)).toList();
    } else {
      throw Exception("❌ فشل جلب المنتجات: ${response.statusCode}");
    }
  }

  /// المنتجات الأكثر طلبًا
  static Future<List<ObjctModle>> fetchBestProducts() async {
    final all = await fetchAllProducts();
    return all.where((p) => p.type == "best").toList();
  }

  /// العروض
  static Future<List<ObjctModle>> fetchOffers() async {
    final all = await fetchAllProducts();
    return all.where((p) => p.type == "offer").toList();
  }
}
