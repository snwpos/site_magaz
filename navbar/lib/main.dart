import 'package:flutter/material.dart';
import 'package:navbar/pages/cloth_page.dart';
import 'package:navbar/pages/detail_page.dart';
import 'package:navbar/pages/cart_page.dart';
import 'package:navbar/pages/catalog_page.dart';
import 'package:navbar/pages/profile_page.dart';
import 'package:navbar/pages/home_page.dart';
import 'package:navbar/api/global_colors.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _currentIndex = 0;

//   final List<Widget> _children = [    
//     HomePage(),    
//     CartPage(),    
//     CatalogPage(),    
//     ProfilePage(),
//     ClothPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Navigation Example',
//       theme: ThemeData(primarySwatch: Colors.pink),
//       home: Scaffold(
//         body: _children[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           selectedLabelStyle: TextStyle(color: Colors.blue),
//           onTap: onTabTapped,
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home, color: Colors.blue,),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_basket, color: Colors.red,),
//               label: 'Cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.category, color: Colors.orange,),
//               label: 'Catalog',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person, color: Colors.black,),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    CartPage(),
    CatalogPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 101, 101, 101),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 173, 78, 250),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Color.fromARGB(255, 227, 89, 255),),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: Color.fromARGB(255, 255, 76, 255),),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 255, 78, 190),),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


