import 'package:appp/controllers/home_controller.dart';
import 'package:appp/widgets/home_page.dart';
import 'package:flutter/material.dart';

import '../../models/clothes/clothes.dart';
import '../../services/storage_service.dart';

class ClothesPage extends StatefulWidget {
  final HomeController _homeController = HomeController();

  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  List<Clothes> _listClothes = [];

  @override
  void initState() {
    super.initState();
    UsernameUpdate();
    widget._homeController.getClothes().then((listClothes) {
      setState(() {
        _listClothes = listClothes;
      });
    });

    // super.initState();
    // UsernameUpdate();
    // widget._homeController.getPage(bookID).then((list) {
    //   setState(() {
    //     _list = [list] ;
    //   });
    // });
  }

  final SecureStorage storage = SecureStorage();
  String buttonText = '';
  String? _username = '';

  Future<String?> getUsername() async {
    _username = await storage.getUsername();
    return _username;
  }

  void UsernameUpdate() {
    getUsername().then((String? username) {
      setState(() {
        if (username == null) {
          buttonText = 'Вход';
        } else {
          _username = username.toString();
          buttonText = '(${_username})Выход';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Главная страница"),
        ),
        body: ListView.builder(
          itemCount: _listClothes.length,
          itemBuilder: (context, index) {
            final itemNews = _listClothes[_listClothes.length - index - 1];

            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.cyan[100],
              child: Column(
                children: [
                  Text(
                    itemNews.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
                  //   child: OutlinedButton(
                  //     onPressed: () => {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   NewPage(bookID: itemNews.id))),
                  //     },
                  //     child: Text(
                  //       'Подробнее',
                  //       style: TextStyle(color: Colors.black),
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
                  //   // child: OutlinedButton(
                  //   // // onPressed: () => {
                  //   // //   Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage(page: itemNews.id)))
                  //   // //   },
                  //   // // child: Text('Подробнее', style: TextStyle(color: Colors.black),),
                  //   // ),
                  // ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Text(
                  //   '${itemNews.timeCreate.split('-')[2].split('T')[0]}.${itemNews.split('-')[1]}.${itemNews.timeCreate.split('-')[0]}г.',
                  //   style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  //   textAlign: TextAlign.right,
                  //     ),
                  // ),
                ],
              ),
            );
          },
        ));
  }
}
