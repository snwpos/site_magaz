import 'package:flutter/material.dart';
import 'package:navbar/widgets/cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (ctx, index) {
              return const CartWidget();
            }));
  }
}
