import 'dart:convert';
import 'dart:io';
import 'package:appp/repository/home_repository.dart';
import 'package:appp/services/storage_service.dart';
import 'package:appp/api/api_model.dart';
import 'package:appp/api/api_connection.dart';
import 'package:appp/models/user_model.dart';
import 'package:appp/models/clothes/clothes.dart';
import 'package:appp/models/clothes/color.dart';
import 'package:appp/models/clothes/type.dart';
import 'package:appp/models/clothes/brand.dart';
import 'package:appp/repository/user_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  HomeRepository homeRepository = HomeRepository();
  Future<void> loginUser(String username, String password) async {
    await homeRepository.loginUser(username, password);

    SecureStorage storage = SecureStorage();
    storage.addUsernameToDb(username);
  }

  Future<String> registerUser(
      String username, String email, String password) async {
    UserRegistration userRegistration =
        UserRegistration(username: username, email: email, password: password);
    dynamic result = await registrationApi(userRegistration);
    String reply = '';
    if (result[0] == 'YES') {
      loginUser(username, password);
    }
    result.forEach((element) {
      reply = reply + '${element}\n';
    });
    return reply;
  }

//   Future<List<Clothes>> getClothes() async {
//     List<Clothes> allClothes = [];
//     print(allClothes);

//     List<dynamic> result = [];
//     print('evabwbw ${result}');
//     result.forEach((element) {
//       allClothes.add(Clothes(
//           name: element['name'],
//           brand: element['brand'],
//           type: element['type'],
//           color: element['color'],
//           price: element['price'],
//           isbn: element['isbn'],
//           img: element['img']));
//     });
//     return allClothes;
//   }
// }

  Future<List<Clothes>> getClothes() async {
    List<Clothes> allClothes = [];
    List<dynamic> result = await clothesListApi();
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(result);
    result.forEach((element) {
      allClothes.add(Clothes.fromJson(element));
      print('Работай даваааааааааааааааааааааааааааай');
    });

    return allClothes;
  }
}
