import 'package:appp/controllers/home_controller.dart';
import 'package:appp/services/storage_service.dart';
import 'package:appp/widgets/clothes/clothes_page.dart';
import 'package:appp/widgets/home_page.dart';
import 'package:appp/widgets/login.dart';

import 'package:flutter/material.dart';
import 'package:appp/models/clothes/clothes.dart';
import 'package:appp/models/clothes/brand.dart';
import 'package:appp/models/clothes/type.dart';
import 'package:appp/models/clothes/color.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Главная страница',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SecureStorage storage = SecureStorage();
  String? _username = "";

  @override
  void initState() {
    super.initState();
    getUserID().then((String? username) {
      setState(() {
        if (username == null) {
          button_text = 'Вход';
          hello_text = 'Вы вышли';
        } else {
          _username = username.toString();
          hello_text = 'Добро пожаловать ${_username}';
          button_text = 'Выход';
        }
      });
    });
  }

  Future<String?> getUserID() async {
    _username = await storage.getUsername();
    return _username;
  }

  String button_text = '';
  String hello_text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
        actions: <Widget>[],
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text('ВОЙТИ'),
                  onPressed: () {
                    if (button_text == 'Выход') {
                      storage.deleteData();
                      setState(() {
                        hello_text = 'Вы вышли';
                        button_text = 'Выход';
                      });
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    }
                  }),
              TextButton(
                child: Text('page'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClothesPage()));
                },
              ),
            ]),
      ),
    );
  }
}