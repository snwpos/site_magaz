import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/api_connect.dart';
import '../models/cloth_model.dart';
// import '../services/api_handler.dart';
import '../widgets/cloth_widget.dart';

class ClothPage extends StatefulWidget {
  const ClothPage({super.key});

  @override
  State<ClothPage> createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
  List<ClothesModel> clothesList = [];

  @override
  void didChangeDependencies() {
    getClothes();
    super.didChangeDependencies();
  }

  Future<void> getClothes() async {
    clothesList = await APIHandler.getAllProducts();
    setState(() {
      
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Clothes'),
      ),
      body: clothesList.isEmpty 
      ? Container() 
      : GridView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
            itemCount: clothesList.length, 
            gridDelegate: 
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.7),
          itemBuilder: (ctx, index){
            return ClothWidget(imageUrl: clothesList[index].image.toString(),
            title: clothesList[index].name.toString(),);
      }),
    );
  }
}

// class ClothPage extends StatefulWidget {
//   const ClothPage({Key? key}) : super(key: key);

//   @override
//   Widget 
//   State<ClothPage> createState() => _ClothPageState();
// }

// class _ClothPageState extends State<ClothPage> {
//   final ScrollController _scrollController = ScrollController();
  
  
//   @override
//   void initState() {
    
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     // getProducts();
//     _scrollController.addListener(() async {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _isLoading = true;
//         print("_isLoading $_isLoading");
//         limit += 10;
//         await getProducts();
//         _isLoading = false;
//         print("limit $limit");
//       }
//     });
//     super.didChangeDependencies();
//   }

  
    
//   }
// }
