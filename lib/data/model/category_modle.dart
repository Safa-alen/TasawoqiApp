class CategoryModle {
  final String id;
  final String title;
  final String image;

  const CategoryModle(
      {required this.id, required this.title, required this.image});
}

class ObjctModle {
  final String title1;
  final String title2;
  final String title3;

  final String Image;
  final int id;

  ObjctModle(
      {required this.title1,
      required this.title2,
      required this.title3,
      required this.Image,
      required this.id});
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
