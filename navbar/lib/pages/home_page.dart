import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:navbar/models/cloth_model.dart';
import 'package:navbar/widgets/cloth_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:navbar/api/api_connect.dart';

import '../widgets/appbar_icons.dart';
import '../widgets/cloth_grid.dart';
import '../widgets/sale_widget.dart';
import 'cloth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;
  List<ClothesModel> clothesList = [];
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

  @override
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
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: size.height * 0.25,
                      child: Swiper(
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return const SaleWidget();
                        },
                        autoplay: true,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white, activeColor: Colors.red)),
                        // control: const SwiperControl(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "All Products",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          AppBarIcons(
                              function: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const ClothPage()));
                              },
                              icon: Icons.arrow_right),
                        ],
                      ),
                    ),
                    clothesList.isEmpty ? Container() :
                    ClothGridWidget(clothesList: clothesList)
                    // GridView.builder(
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: 10,
                    //     gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2,
                    //             crossAxisSpacing: 0.0,
                    //             mainAxisSpacing: 0.0,
                    //             childAspectRatio: 0.7),
                    //     itemBuilder: (ctx, index) {
                    //       return const ClothWidget();
                    //     })
                  ]),
                ),
              )
            ],
          ),
        ));
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