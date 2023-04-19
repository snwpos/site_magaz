import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../widgets/sale_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Theme.of(context).cardColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
              ),
            ),
            SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const SaleWidget();
                    },
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.white,
                            activeColor: Colors.purple)),
                  
                  ),
            ), 
          ],
        ),
      ),
    );
  }
}
 // children: (
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Home Page',
          //       style: TextStyle(fontSize: 24),
          //     ),
              
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => DetailPage()),
          //         );
          //       },
          //       child: Text('Go to Details'),
          //     ),
          //   ],
          // ),