import 'package:flutter/material.dart';

import '../widgets/catalog_widget.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
            itemCount: 5, 
            gridDelegate: 
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 1.2),
          itemBuilder: (ctx, index){
            return const CatalogWidget();
      }),
    );
  }
}