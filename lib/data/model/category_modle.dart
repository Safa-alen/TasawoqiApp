class CategoryModle {
  final String id;
  final String title;
  final String image;

  const CategoryModle({
    required this.id,
    required this.title,
    required this.image,
  });

  // 🔥 التحويل من JSON إلى Dart Object
  factory CategoryModle.fromJson(Map<String, dynamic> json) {
    return CategoryModle(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }

  // 🔥 التحويل من Dart Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}

class ObjctModle {
  final String id;
  final String title1;
  final String title2;
  final double title3;
  final String title4;
  final String point;
  final List<String> sizes;
  final List<int> colorHexes;
  final String prepTime;
  final List<String> quantity;
  final String Image;

  ObjctModle({
    required this.id,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.Image,
    required this.point,
    this.sizes = const [],
    this.colorHexes = const [],
    this.prepTime = '',
    this.quantity = const [],
  });

  // 🔥 fromJson
  factory ObjctModle.fromJson(Map<String, dynamic> json) {
    return ObjctModle(
      id: json['id'] as String,
      title1: json['title1'] as String,
      title2: json['title2'] as String,
      title3: (json['title3'] as num).toDouble(), // مهم
      title4: json['title4'] as String,
      Image: json['image'] as String,
      point: json['point'] ?? '',
      sizes: List<String>.from(json['sizes'] ?? []),
      colorHexes: List<int>.from(json['colorHexes'] ?? []),
      prepTime: json['prepTime'] ?? '',
      quantity: List<String>.from(json['quantity'] ?? []),
    );
  }

  // 🔥 toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title1': title1,
      'title2': title2,
      'title3': title3,
      'title4': title4,
      'image': Image,
      'point': point,
      'sizes': sizes,
      'colorHexes': colorHexes,
      'prepTime': prepTime,
      'quantity': quantity,
    };
  }
}
