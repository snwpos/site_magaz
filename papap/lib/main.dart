import 'package:flutter/material.dart';
import 'package:papap/controllers/home_controller.dart';
import 'package:papap/models/cloth.dart';
import 'package:papap/storage/storage.dart';

import 'pages/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Главная страница',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//               appBar: AppBar(
//           backgroundColor: Colors.lightBlue,
//           title: const Text('Кинотеатры'),
//               ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
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
    // print("TTTTTTTTTTTT: ${_userID.first.key}: ${_userID.first.value}");
    return _username;
  }

  String button_text = '';
  String hello_text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Кинотеатр'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  if (button_text == 'Выход') {
                    storage.deleteData();
                    setState(() {
                      hello_text = 'Вы вышли';
                      button_text = 'Вход';
                    });
                  } else {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  }
                },
                child: Text(button_text))
          ],
        ),
        // drawer: Drawer(
        //   child: Scaffold(

        //   ),
        // ),
        body: Center(
          child: TextButton(
            child: Text('страница'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClothesPage()));
            },
          ),
        ));
  }
}

class ClothesPage extends StatefulWidget {
  final HomeController _homeController = HomeController();
  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  List<Clothes> _listClothes = [];

  List<Map<String, dynamic>> typeList = [];

  @override
  void initState() {
    super.initState();
    widget._homeController.getClothes().then((listClothes) {
      setState(() {
        _listClothes = listClothes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _listClothes.length,
        itemBuilder: (context, index) {
          final itemClothes = _listClothes[_listClothes.length - index - 1];

          print('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF${typeList}');
          // final clothesState = itemClothes[]
          print('fsdfsdfsdfsdfsdfsdfsfsdfsdfsdfsdfs ${_listClothes}');
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            color: Colors.cyan[100],
            child: Column(children: [
              Text(
                itemClothes.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                itemClothes.type[
                    'name'], // Access the name property inside the type map
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textAlign: TextAlign.left,
              ),
            ]),
          );
        },
      ),
    );
  }
}
