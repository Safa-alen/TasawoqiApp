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
    image: AppImagess.cat3, //456781114
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
    id: 2,
    title1: 'عصير ايكرفون',
    title2: 'عصائر الملك',
    title3: '60/',
    Image: AppImagess.drink1,
    title4: 'لوريم ابسوم ...',
    point: '5 نقاط',
  ),
  ObjctModle(
    id: 1,
    title1: 'عصائر الملك',
    title2: 'عصائر الآغا',
    title3: '60/',
    Image: AppImagess.drink2,
    title4: 'لوريم ابسوم ...',
    point: '5 نقاط',
  ),
  ObjctModle(
    id: 12,
    title1: 'سائل غسيل مدار',
    title2: 'سوبر ماركت العائلة',
    title3: 'كغ1/ 100',
    Image: AppImagess.madar,
    title4: 'لوريم ابسوم ...',
    point: '5 نقاط',
    colorHexes: [],
  ),
  ObjctModle(
    id: 4,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 5,
    title1: 'برغر لحمة',
    title2: 'برغر كينغ للوجبات السريعة',
    title3: 'كغ1/ 100',
    Image: AppImagess.reco2,
    title4: 'لوريم ابسوم ...',
    point: '5 نقاط',
    colorHexes: [],
  ),
  ObjctModle(
    id: 6,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
      id: 7,
      title1: 'بابريكا',
      title2: 'بهارات الأحمد',
      title3: 'كغ1/ 100',
      Image: AppImagess.spices,
      title4:
          '\n لوريم ابسوم لوريم  لوريم ابسوم لوريم ابسوم الم \n لوريم ابسوم لوريم ابسوملوريم  لوريم ابسوم الم \nلوريم ابسوملوريم ابسوم  ابسوم لوريم ابسوم',
      point: 'نقاط5 ',
      colorHexes: [],
      quantity: ["بالكيلوغرام", "بالغرام", "بالسعر"]),
  ObjctModle(
    id: 8,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 9,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 10,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 11,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 12,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 13,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 14,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 15,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
      id: 1,
      title1: 'برغر لحمة',
      title2: 'برغر كينغ للوجبات السريعة',
      title3: '/ 1كغ',
      Image: AppImagess.reco2,
      title4:
          'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم',
      point: '5 نقاط',
      colorHexes: [],
      prepTime: "زمن التحضير 15 دقيقة"),
  ObjctModle(
    id: 17,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 18,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 19,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 20,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 21,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 22,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 23,
    title1: 'حذاء رياضي',
    title2: 'نايكي',
    title3: 'حجم 42',
    Image: AppImagess.foot,
    title4: 'لوريم ابسوم ...',
    point: '5 نقاط',
    colorHexes: [0xFFE91E63, 0xFF2196F3, 0xFFFFC107, 0xFF000000],
    sizes: ["37", "38", "39", "40", "41"],
  ),
  ObjctModle(
    id: 24,
    title1: 'فستان سهرة باييت / نسائي',
    title2: 'ديفا بوتيك',
    title3: ' 100/1كغ',
    Image: AppImagess.wman,
    title4:
        "لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم",
    point: '5 نقاط',
    colorHexes: [0xFFE91E63, 0xFF2196F3, 0xFFFFC107, 0xFF000000],
    sizes: ["S", "M", "L", "XL", "XXL"],
  ),
  ObjctModle(
    id: 25,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 26,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 27,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 28,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
  ObjctModle(
    id: 29,
    title1: '',
    title2: '',
    title3: '',
    Image: AppImagess.drink2,
    title4: '',
    point: '',
    colorHexes: [],
  ),
];

// List<ObjctModle> object = [
//   ObjctModle(

//       Image: AppImagess.drink1,
//       title1: 'عصير ايكرفون',
//       title2: 'عصائر الملك',
//       title3: '60/',
//       title4:
//           'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم',
//       point: '5 نقاط', id: 2),

//   ObjctModle(

//       title1: ' عصائر الملك',
//       title2: 'عصائر الآغا',
//       title3: '60/',
//       id: 2,
//       Image: AppImagess.drink2, point: '5نقاط',
//        title4: 'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم'),
//   ObjctModle(
//       id: 12,
//       title1: 'سائل غسيل مدار',
//       title2: 'سوبر ماركت العائلة',
//       title3: 'كغ1/ 100',
//       Image: AppImagess.madar, point: 'نقاط5', title4: 'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم'),

//   ObjctModle(
//       id: 4, title1: '', title2: '', title3: '', Image: AppImagess.drink2, title4: '', point: ''),

//   ObjctModle(
//       id: 5,
//       title1: 'برغر لحمة',
//       title2: 'برغر كينغ للوجبات السريعة',
//       title3: 'كغ1/ 100',
//       Image: AppImagess.reco2,
//       title4:
//           'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم'),
//   ObjctModle(
//       id: 6, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 7,
//       title1: 'بابريكا',
//       title2: 'بهارات الأحمد',
//       title3: 'كغ1/ 100',
//       Image: AppImagess.drink2,
//       title4:
//           'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم',
//       point: '5 نقاط'),
//   ObjctModle(
//       id: 8, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 9, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 10, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 11, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 12, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 13, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 14, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 15, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 16, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 17, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 18, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 19, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 20, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 21, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 22, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 23, title1: '', title2: '', title3: '', Image: AppImagess.drink2, point: '', title4: '', colorHexes: []),

//   ObjctModle(
//       id: 24,
//       title1: 'فستان سهرة باييت / نسائي',
//       title2: 'ديفا بوتيك',
//       title3: 'كغ1/ 100',
//       point: '5نقاط',
//       title4:
//           'لوريم ابسوم لوريم ابسوم لوريم ابسوم لوريم ابسوم الم  لوريم ابسوم لوريم ابسوملوريم ابسوم لوريم ابسوم الم لوريم ابسوملوريم ابسوم لوريم ابسوم لوريم ابسوم',
//       Image: AppImagess.wman,),

//   ObjctModle(
//       id: 25, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 26, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 27, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 28, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
//   ObjctModle(
//       id: 29, title1: '', title2: '', title3: '', Image: AppImagess.drink2),
// ];

List<RecommstoresModle> Recommstores = [
  RecommstoresModle(
      title1: "العائلة للخضراوات",
      title2: "كافة أنواع الخضراوات والفواكه",
      image: AppImagess.reco1),
  RecommstoresModle(
      title1: "برغر كينغ",
      title2: "كافة الوجبات السريعة الغربية ",
      image: AppImagess.reco2),
  RecommstoresModle(
      title1: "برغر كينغ",
      title2: "كافة الوجبات السريعة الغربية ",
      image: AppImagess.reco2),
  RecommstoresModle(
      title1: "برغر كينغ",
      title2: "كافة الوجبات السريعة الغربية ",
      image: AppImagess.reco2),
];

List<BestCategoryModle> BestCategories = [
  BestCategoryModle(
      image: AppImagess.reco3,
      title1: "برغر لحمة",
      title2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
  BestCategoryModle(
      image: AppImagess.reco1,
      title1: "برغر لحمة",
      title2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
  BestCategoryModle(
      image: AppImagess.reco3,
      title1: "برغر لحمة",
      title2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
  BestCategoryModle(
      image: AppImagess.reco1,
      title1: "برغر لحمة",
      title2: "برغر كينغ للوجبات السريعة",
      title3: "60/قطعة"),
];
