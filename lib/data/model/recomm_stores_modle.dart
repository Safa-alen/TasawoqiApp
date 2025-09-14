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
      image: json['image'] ?? '',
      title1: json['title1'] ?? '',
      title2: json['title2'] ?? '',
      title3: json['title3'] ?? '',
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
  final List<Product> products;

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

  factory RecommstoresModle.fromJson(Map<String, dynamic> json) {
    return RecommstoresModle(
      title1: json['title1'] ?? '',
      title2: json['title2'] ?? '',
      title3: json['title3'] ?? '',
      title4: json['title4'] ?? '',
      address: json['address'] ?? '',
      workinghours: json['workinghours'] ?? '',
      image: json['image'] ?? '',
      products: (json['products'] as List<dynamic>? ?? [])
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title1': title1,
        'title2': title2,
        'title3': title3,
        'title4': title4,
        'address': address,
        'workinghours': workinghours,
        'image': image,
        'products': products.map((e) => e.toJson()).toList(),
      };
}
