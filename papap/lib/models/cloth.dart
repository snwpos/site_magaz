



import 'package:papap/models/type.dart';

class Clothes {
  int id;
  String name;
  double price;
  dynamic type;
  // image?
  
  Clothes(
      {required this.id,
      required this.name,
      required this.price,
      required this.type});


  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        type: json['type']);
  }
}




// class Types {
//   int id;
//   String name;

//   Types({
//     required this.id,
//     required this.name,
//   });

//   factory Types.fromJson(Map<String, dynamic> json) {
//     return Types(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
