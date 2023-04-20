import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:navbar/models/cloth_model.dart';
// import 'package:navbar/services/api_handler.dart';


class ClothDetails extends StatefulWidget {
  const ClothDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ClothDetails> createState() => _ClothDetailsState();
}

class _ClothDetailsState extends State<ClothDetails> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              const BackButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Category",
                      style: 
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            "AAA",
                            textAlign: TextAlign.start,
                            style: titleStyle,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(33, 150, 243, 1)),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "100",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight:
                                              FontWeight.bold)),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return FancyShimmerImage(
                      width: double.infinity,
                      imageUrl:
                          "https://i.pinimg.com/originals/4e/a6/ff/4ea6ff216192ebf6409aee6af8978ef0.png",
                      boxFit: BoxFit.fill,
                    );
                  },
    
                  autoplay: true,
                  itemCount: 3,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    ),
                  ),
                  // control: const SwiperControl(),
                ),
              ),
              const SizedBox(
                  height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Brand', style: titleStyle),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Description",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.heart_broken),
            ],
          ),
        ),
      ),
    );
  }
}