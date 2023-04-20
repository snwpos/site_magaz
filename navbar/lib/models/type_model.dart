import 'package:flutter/material.dart';
import 'cloth_model.dart';

// class TypeModel with ChangeNotifier {
//   int? id;
//   String? name;
//   String? image;

//   TypeModel({this.id, this.name, this.image});

//   TypeModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }
//   static List<TypeModel> categoriesFromSnapshot(List categoriesSnaphot) {
//     // print("data ${categoriesSnaphot[0]}");
//     return categoriesSnaphot.map((data) {
//       return TypeModel.fromJson(data);
//     }).toList();
//   }
// }

// class TypeModel {
//   late int id;
//   late String name;

//   TypeModel(
//     this.id,
//     this.name,
//   );

//   TypeModel.fromJson(Map<String, dynamic> json) {
//     typeModel.id = json['id'];
//     typeModel.name = json['name'];

//   }
// }

class TypeModel {
  int? id;
  String? name;

  TypeModel({this.id, this.name});

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}