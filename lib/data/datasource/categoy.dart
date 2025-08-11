import 'dart:core';

import 'package:tasawoqi/core/constant/imagess.dart';
import 'package:tasawoqi/data/model/category_modle.dart';

List<CategoryModle> categories = [
  CategoryModle(
    title: "مأكولات",
    image: AppImagess.cat1,
    id: '1',
  ),
  CategoryModle(title: "مشروبات", image: AppImagess.cat2, id: '2'),
  CategoryModle(
    title: "خبز",
    image: AppImagess.cat3,
    id: '3',
  ),
  CategoryModle(
    title: "فواكه",
    image: AppImagess.cat4,
    id: '4',
  ),
  CategoryModle(title: "لحومات", image: AppImagess.cat15, id: '5'),
  CategoryModle(title: "حلويات", image: AppImagess.cat6, id: '6'),
  CategoryModle(title: "توابل", image: AppImagess.cat7, id: '7'),
  CategoryModle(title: "قهوة", image: AppImagess.cat8, id: '8'),
  CategoryModle(title: "بقالة", image: AppImagess.cat9, id: '9'),
  CategoryModle(title: "مياه", image: AppImagess.cat10, id: '10'),
  CategoryModle(title: "مكسرات", image: AppImagess.cat11, id: '11'),
  CategoryModle(title: "منظفات", image: AppImagess.cat12, id: '12'),
  CategoryModle(title: "ضيافة", image: AppImagess.cat13, id: '13'),
  CategoryModle(title: "ألبان وأجبان", image: AppImagess.cat14, id: '14'),
  CategoryModle(title: "أواني", image: AppImagess.cat15, id: '15'),
  CategoryModle(title: "ألعاب", image: AppImagess.cat16, id: '16'),
  CategoryModle(title: "جمال", image: AppImagess.cat17, id: '17'),
  CategoryModle(title: "قرطاسية", image: AppImagess.cat18, id: '18'),
  CategoryModle(title: "بسكوت", image: AppImagess.cat19, id: '19'),
  CategoryModle(title: "مثلجات", image: AppImagess.cat20, id: '20'),
  CategoryModle(title: "موبايل", image: AppImagess.cat21, id: '21'),
  CategoryModle(title: "نظارات", image: AppImagess.cat22, id: '22'),
  CategoryModle(title: "أحذية", image: AppImagess.cat23, id: '23'),
  CategoryModle(title: "ملابس", image: AppImagess.cat24, id: '24'),
  CategoryModle(title: "عطورات", image: AppImagess.cat25, id: '25'),
  CategoryModle(title: "حقائب", image: AppImagess.cat26, id: '26'),
  CategoryModle(title: "أكسسوار", image: AppImagess.cat27, id: '27'),
  CategoryModle(title: "كتب", image: AppImagess.cat28, id: '28'),
  CategoryModle(title: "ساعات", image: AppImagess.cat29, id: '29'),
];
List<ObjctModle> object = [
  ObjctModle(
      id: 1,
      categories: ["عصير برتقال", "عصائر الآغا", "/قطعة"],
      Image: AppImagess.drink1),
  ObjctModle(
      id: 1,
      categories: [" عصير ايكرفون", "عصائر الملك ", "/قطعة"],
      Image: AppImagess.drink2)
];

List<RecommstoresModle> Recommstores = [
  RecommstoresModle(
      title1: "العائلة للخضراوات",
      titl2: "كافة أنواع الخضراوات والفواكه",
      image: AppImagess.reco1),
  RecommstoresModle(
      title1: "برغر كينغ",
      titl2: "كافة الوجبات السريعة الغربية ",
      image: AppImagess.reco2),
  RecommstoresModle(
      title1: "برغر كينغ",
      titl2: "كافة الوجبات السريعة الغربية ",
      image: AppImagess.reco2),
  RecommstoresModle(
      title1: "برغر كينغ",
      titl2: "كافة الوجبات السريعة الغربية ",
      image: AppImagess.reco2),
];
List<BestCategoryModle> BestCategories = [
  BestCategoryModle(
      image: AppImagess.reco3,
      title1: "برغر لحمة",
      titl2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
  BestCategoryModle(
      image: AppImagess.reco1,
      title1: "برغر لحمة",
      titl2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
  BestCategoryModle(
      image: AppImagess.reco3,
      title1: "برغر لحمة",
      titl2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
  BestCategoryModle(
      image: AppImagess.reco1,
      title1: "برغر لحمة",
      titl2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
];
