// // lib/services/api_service.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ApiService {
//   final String baseUrl = "https://example.com/api";

//   // ✅ دالة لحفظ التوكن بعد تسجيل الدخول
//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("token", token);
//   }

//   // ✅ دالة لجلب التوكن عند الحاجة
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString("token");
//   }

//   // ✅ دالة لمسح التوكن (تسجيل خروج)
//   Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove("token");
//   }

//   // ✅ تسجيل الدخول
//   Future<bool> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/login"), // endpoint تبع تسجيل الدخول
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "email": email,
//         "password": password,
//       }),

//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       // نفترض الباك بيرجع token
//       final token = data["token"];

//       // خزن التوكن بالذاكرة
//       await saveToken(token);

//       return true;
//     } else {
//        print("Login failed: ${response.body}");
//       return false;
//     }

//   }
// }
// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "https://example.com/api";

  // ✅ دالة لحفظ التوكن بعد تسجيل الدخول أو التسجيل
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance(); // صححت اسم الكلاس
    await prefs.setString("token", token);
  }

  // ✅ دالة لجلب التوكن عند الحاجة
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  // ✅ دالة لمسح التوكن (تسجيل خروج)
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  // ✅ تسجيل الدخول
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"), // endpoint تبع تسجيل الدخول
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // نفترض الباك بيرجع token
      final token = data["token"];

      // خزن التوكن بالذاكرة
      await saveToken(token);

      return true;
    } else {
      print("Login failed: ${response.body}");
      return false;
    }
  }

// ✅ دالة للتحقق من كود التفعيل (OTP / verification code)
  Future<Map<String, dynamic>> verifyCode(String code) async {
    final token = await getToken(); // جلب التوكن من الذاكرة

    final response = await http.post(
      Uri.parse("$baseUrl/verify-code"), // endpoint للتحقق
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // إرسال التوكن مع الطلب
      },
      body: jsonEncode({
        "code": code,
      }),
    );

    if (response.statusCode == 200) {
      // نفترض الباك يرسل { "success": true/false, "message": "" }
      return jsonDecode(response.body);
    } else {
      throw Exception("فشل التحقق من الكود: ${response.body}");
    }
  }

  // ✅ تسجيل مستخدم جديد
  Future<Map<String, dynamic>> signup(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl/signup"), // endpoint تبع التسجيل
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data), // data تحتوي على username, email, phone, password
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final result = jsonDecode(response.body);

      // إذا الباك رجع توكن بعد التسجيل
      if (result["token"] != null) {
        await saveToken(result["token"]);
      }

      return result; // ممكن تحتوي على بيانات المستخدم أو التوكن
    } else {
      throw Exception("فشل التسجيل: ${response.body}");
    }
  }
}
