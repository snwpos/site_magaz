class Cart {
  String name;
  int price;
  // Url url;
  Cart(
      {required this.name,
      
      required this.price,
     
      // required this.url
      });

  factory Cart.fromJson(Map<String, dynamic> json) {
    if (json['name'] == '') {
      json['name'] = 'Товар отсуствует';
    }
    return Cart(
        name: json['name'],
        
        price: json['price'],
        
        // url: json['url']
        );
  }
}
