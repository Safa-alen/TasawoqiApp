import 'package:get/get.dart';
import 'package:tasawoqi/core/services/product_service.dart';
import 'package:tasawoqi/data/model/category_modle.dart';

class ApiProductController extends GetxController {
  List<ObjctModle> allProducts = [];
  List<ObjctModle> bestProducts = [];
  List<ObjctModle> offers = [];

  bool isLoading = false;
  String? errorMessage;

  /// 🔹 تحميل كل المنتجات
  Future<void> loadProducts() async {
    try {
      isLoading = true;
      errorMessage = null;
      update();

      final products = await ProductService.fetchAllProducts();
      allProducts = products;

      /// فلترة "الأكثر طلباً"
      bestProducts = products.where((p) => p.type == ProductType.best).toList();

      /// فلترة "العروض"
      offers = products.where((p) => p.type == ProductType.offer).toList();
    } catch (e) {
      errorMessage = "❌ خطأ أثناء تحميل المنتجات: $e";
      print(errorMessage);
    } finally {
      isLoading = false;
      update(); // 🔥 تحديث الواجهة
    }
  }

  /// 🔹 تحديث المنتجات الأكثر طلباً فقط
  Future<void> loadBestProducts() async {
    try {
      isLoading = true;
      update();

      bestProducts = await ProductService.fetchBestProducts();
    } catch (e) {
      print("❌ خطأ أثناء تحميل المنتجات الأكثر طلباً: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  /// 🔹 تحديث العروض فقط
  Future<void> loadOffers() async {
    try {
      isLoading = true;
      update();

      offers = await ProductService.fetchOffers();
    } catch (e) {
      print("❌ خطأ أثناء تحميل العروض: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}
