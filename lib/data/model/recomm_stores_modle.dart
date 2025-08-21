class Product {
  final String image;
  final String title1;
  final String title2;
  final String title3;

  Product({
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      title1: json['title1'],
      title2: json['title2'],
      title3: json['title3'],
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'title1': title1,
        'title2': title2,
        'title3': title3,
      };
}

class RecommstoresModle {
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  final String address;
  final String workinghours;

  final String image;
  final List<Product> products; // ← أضفنا المنتجات هنا

  RecommstoresModle({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.address,
    required this.workinghours,
    required this.image,
    required this.products,
  });
}

class BestCategoryModle {
  final String id;
  final String image;
  final String title1;
  final String title2;
  final String title3;

  BestCategoryModle(
      {required this.id,
      required this.image,
      required this.title1,
      required this.title2,
      required this.title3});
}
