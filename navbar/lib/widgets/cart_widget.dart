import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';


class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
              height: size.width * 0.15,
              width: size.width * 0.15,
              errorWidget: const Icon(
                Icons.dangerous,
                color: Colors.red,
                size: 28,
              ),
              imageUrl:
                  "https://cdn1.epicgames.com/offer/879b0d8776ab46a59a129983ba78f0ce/genshintall_1200x1600-4a5697be3925e8cb1f59725a9830cafc",
              boxFit: BoxFit.fill,
            ),
            title: const Text("Cloth name"),
            subtitle: const Text("Brand"),
            trailing: const Text("price"),
    );
  }
}