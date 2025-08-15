class CategoryModle {
  final String id;
  final String title;
  final String image;

  const CategoryModle(
      {required this.id, required this.title, required this.image});
}

class ObjctModle {
  final int id;
  final String title1;
  final String title2;
  final String title3;
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
    this.point = '',
    this.sizes = const [],
    this.colorHexes = const [],
    this.prepTime = '',
    this.quantity = const [],
  });
}

class RecommstoresModle {
  final String title1;
  final String title2;

  final String image;

  RecommstoresModle(
      {required this.title1, required this.title2, required this.image});
}

class BestCategoryModle {
  final String image;
  final String title1;
  final String title2;
  final String title3;

  BestCategoryModle(
      {required this.image,
      required this.title1,
      required this.title2,
      required this.title3});
}
