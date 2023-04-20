// import 'dart:convert';
// import 'dart:developer';

import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:navbar/models/cloth_model.dart';
// import 'package:navbar/consts/api_consts.dart';
// import 'package:navbar/models/type_model.dart';
// import 'package:navbar/models/cloth_model.dart';
// import 'package:navbar/models/users_model.dart';

class APIHandler {
  static Future<List<ClothesModel>> getAllProducts() async {
    var response = await http
        .get(Uri.parse("http://192.168.0.107:8000/main/api/clothes/"));

    // print("response ${jsonDecode(response.body)}");
    var data = jsonDecode(response.body);
    List tempList = [];
    for (var v in data) {
      tempList.add(v);
      // print("V $v \n\n");
    }
    return ClothesModel.productsFromSnapshot(tempList);
  }
}

// class APIHandler {
//   static Future<List<dynamic>> getData(
//       {required String target, String? limit}) async {
//     try {
//       var uri = Uri.https(
//           BASE_URL,
//           "api/v1/$target",
//           target == "products"
//               ? {
//                   "offset": "0",
//                   "limit": limit,
//                 }
//               : {});
//       var response = await http.get(uri);

//       // print("response ${jsonDecode(response.body)}");
//       var data = jsonDecode(response.body);
//       List tempList = [];
//       if (response.statusCode != 200) {
//         throw data["message"];
//       }
//       for (var v in data) {
//         tempList.add(v);
//         // print("V $v \n\n");
//       }
//       return tempList;
//     } catch (error) {
//       log("An error occured $error");
//       throw error.toString();
//     }
//   }

//   static Future<List<ClothesModel>> getAllProducts(
//       {required String limit}) async {
//     List temp = await getData(
//       target: "products",
//       limit: limit,
//     );
//     return ClothesModel.productsFromSnapshot(temp);
//   }

//   static Future<List<TypeModel>> getAllCategories() async {
//     List temp = await getData(target: "categories");
//     return TypeModel.categoriesFromSnapshot(temp);
//   }

//   static Future<List<UsersModel>> getAllUsers() async {
//     List temp = await getData(target: "users");
//     return UsersModel.usersFromSnapshot(temp);
//   }

//   static Future<ClothesModel> getProductById({required String id}) async {
//     try {
//       var uri = Uri.https(
//         BASE_URL,
//         "api/v1/products/$id",
//       );
//       var response = await http.get(uri);

//       // print("response ${jsonDecode(response.body)}");
//       var data = jsonDecode(response.body);
//       if (response.statusCode != 200) {
//         throw data["message"];
//       }
//       return ClothesModel.fromJson(data);
//     } catch (error) {
//       log("an error occured while getting product info $error");
//       throw error.toString();
//     }
//   }
// }