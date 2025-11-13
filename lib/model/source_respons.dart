// class SourceResponse{
//   String status;
//   List<> sources;
// }
//
// class source{
//   String id;
//   String name;
//   String langue;
//   String country;
//   String url;
//   String description;
//   String category;
//
//   source({required this.id, required this.name, required this.langue,
//     required this.country, required this.url,
//     required this.description, required this.category});
//
//   source.fromJson(Map<String, dynamic> json):this(
//     id: json['id'],
//     name: json['name'],
//     langue: json['langue'],
//     country: json['country'],
//     url: json['url'],
//     description: json['description'],
//     category: json['category'],
//   );
//
//   Map<String, dynamic> toJson(){
//     return{
//       'id': id,
//       'name': name,
//       'langue': langue,
//       'country': country,
//       'url': url,
//       'description': description,
//       'category': category,
//     }
//   }
//
// }