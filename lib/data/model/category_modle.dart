class CategoryModle {
  final String id;
  final String title;
  final String image;

  const CategoryModle(
      {required this.id, required this.title, required this.image});
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
    this.point = '',
    this.sizes = const [],
    this.colorHexes = const [],
    this.prepTime = '',
    this.quantity = const [],
  });
}

class OffersModle {
  final String imageo;
  final String title1o;
  final String title2o;
  final String title3o;

  OffersModle(
      {required this.imageo,
      required this.title1o,
      required this.title2o,
      required this.title3o});
}
