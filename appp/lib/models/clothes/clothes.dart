import 'package:appp/models/clothes/brand.dart';
import 'package:appp/models/clothes/type.dart';
import 'package:appp/models/clothes/color.dart';

class Books {
  String name;
  Brand brand;
  Type type;
  Color color;
  int price;
  int isbn;
  String img;
  // Url url;
  Books(
      {required this.name,
      required this.brand,
      required this.type,
      required this.color,
      required this.price,
      required this.isbn,
      required this.img,
      // required this.url
      });

  factory Books.fromJson(Map<String, dynamic> json) {
    if (json['name'] == '') {
      json['name'] = 'Товар отсуствует';
    }
    return Books(
        name: json['name'],
        brand: json['brand'],
        type: json['type'],
        color: json['color'],
        price: json['price'],
        isbn: json['isbn'],
        img: json['img'],
        // url: json['url']
        );
  }
}
