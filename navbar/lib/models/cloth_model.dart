import 'type_model.dart';

class ClothesModel {
  int? id;
  String? name;
  int? price;
  String? image;
  String? brand;
  TypeModel? type;

  ClothesModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.brand,
    this.type,
  });

  ClothesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    brand = json['brand'];
    type = json['type'] != null ? TypeModel.fromJson(json['type']) : null;
  }
  static List<ClothesModel> productsFromSnapshot(List productSnaphot) {
    // print("data ${productSnaphot[0]}");
    return productSnaphot.map((data) {
      print("dataaaaa ${productSnaphot[0]}");
      return ClothesModel.fromJson(data);
    }).toList();
  }
}

// class ClothesModel with ChangeNotifier {
//   int? id;
//   String? name;
//   int? price;
//   String? brand;
//   TypeModel? type;
//   List<String>? images;

//   ClothesModel(
//       {this.id,
//       this.name,
//       this.price,
//       this.brand,
//       this.type,
//       this.images});

//   ClothesModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['title'];
//     price = json['price'];
//     brand = json['description'];
//     type = json['category'] != null
//         ? TypeModel.fromJson(json['type'])
//         : null;
//     images = json['images'].cast<String>();
//   }
//   static List<ClothesModel> ClothesFromSnapshot(List Clothesnaphot) {
//     // print("data ${Clothesnaphot[0]}");
//     return Clothesnaphot.map((data) {
//       return ClothesModel.fromJson(data);
//     }).toList();
//   }
// }