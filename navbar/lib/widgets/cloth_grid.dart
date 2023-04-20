import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cloth_model.dart';
import 'cloth_widget.dart';

class ClothGridWidget extends StatelessWidget {
  const ClothGridWidget({Key? key, required this.clothesList})
      : super(key: key);
  final List<ClothesModel> clothesList;
  // final List<ClothesModel> clothesList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          // return ChangeNotifierProvider.value(
          //   value: clothesList[index],
          return ClothWidget(
            // imageUrl: clothesList[index].image.toString(),
            imageUrl:
                  "https://cdn1.epicgames.com/offer/879b0d8776ab46a59a129983ba78f0ce/genshintall_1200x1600-4a5697be3925e8cb1f59725a9830cafc",
            title: clothesList[index].name.toString(),
          );
          
          
        });
  }
}