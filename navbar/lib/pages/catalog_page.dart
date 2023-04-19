import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: Center(
        child: Text(
          'Catalog',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}