import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:navbar/models/cloth_model.dart';

import '../pages/cloth_details.dart';

// import '../consts/global_colors.dart';
// import '../pages/cloth_details.dart';

class ClothWidget extends StatelessWidget {
  const ClothWidget({Key? key, required this.title, required this.imageUrl}) : super(key: key);
  final String title, imageUrl;
  @override
  Widget build(BuildContext context) {
    // final productsModelProvider = Provider.of<ProductsModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ClothDetails(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: '\$',
                            style: const TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "69",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                    // const Icon(Icons.heart_broken),
                  ],
                ),
              ),
              ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.45,
              width: size.width * 0.45,
              errorWidget: const Icon(
                Icons.dangerous,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: 
                  "https://cdn1.epicgames.com/offer/879b0d8776ab46a59a129983ba78f0ce/genshintall_1200x1600-4a5697be3925e8cb1f59725a9830cafc",
              boxFit: BoxFit.fill,
            ),
          ),
              // const SizedBox(height: 10),
              // const Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     title,
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 2,
              //     style: TextStyle(
              //       fontSize: 17,
              //       //  fontFamily: 'Roboto',
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
