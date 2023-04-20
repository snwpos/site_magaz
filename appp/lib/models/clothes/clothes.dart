import 'package:appp/models/clothes/brand.dart';
import 'package:appp/models/clothes/type.dart';
import 'package:appp/models/clothes/color.dart';

class Clothes {
  String name;
  Brand brand;
  Type type;
  Color color;
  int price;
  int isbn;
  String img;
  // Url url;
  Clothes(
      {required this.name,
      required this.brand,
      required this.type,
      required this.color,
      required this.price,
      required this.isbn,
      required this.img,
      // required this.url
      });

  factory Clothes.fromJson(Map<String, dynamic> json) {
    
    Brand brand = Brand.fromJson(json['brand']);
    Type type = Type.fromJson(json['type']);
    Color color = Color.fromJson(json['color']);
    
    if (json['name'] == '') {
      json['name'] = 'Товар отсуствует';
    }
    return Clothes(
        name: json['name'],
        brand: brand,
        type: type,
        color: color,
        price: json['price'],
        isbn: json['isbn'],
        img: json['img'],
        // url: json['url']
        );
  }
}
