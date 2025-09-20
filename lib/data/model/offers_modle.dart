// class OffersModle {
//   final String imageo;
//   final String title1o;
//   final String title2o;
//   final String title3o;

//   OffersModle({
//     required this.imageo,
//     required this.title1o,
//     required this.title2o,
//     required this.title3o,
//   });

//   // من JSON → Dart Object
//   factory OffersModle.fromJson(Map<String, dynamic> json) {
//     return OffersModle(
//       imageo: json['imageo'] ?? '',
//       title1o: json['title1o'] ?? '',
//       title2o: json['title2o'] ?? '',
//       title3o: json['title3o'] ?? '',
//     );
//   }

//   // من Dart Object → JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'imageo': imageo,
//       'title1o': title1o,
//       'title2o': title2o,
//       'title3o': title3o,
//     };
//   }
// }
