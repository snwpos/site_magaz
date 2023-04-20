import 'dart:async';
import 'dart:convert';

import 'package:appp/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:appp/widgets/login.dart';
import 'package:appp/models/clothes/clothes.dart';
import 'package:appp/models/clothes/color.dart';
import 'package:appp/models/clothes/type.dart';
import 'package:appp/models/clothes/brand.dart';
import '../services/storage_service.dart';
import 'package:appp/api/api_model.dart';

final _base = "http://192.168.0.107:8000";
final _signInURL = "/main/token/";
final _refresh = "/main/token/refresh/";
final _registrationEndpoint = "/api/registration/";
final _clothesAll = "/main/api/clothes/";

final _login = _base + _signInURL;
final _clothAll = _base + _clothesAll;
final _registration = _base + _registrationEndpoint;

Future<void> refreshToken() async {
  var token = await SecureStorage().getRefreshToken();
  if (token != null) {
    token = token;
  }
  Map<String, String> refreshTokenMap = {'refresh': '${token}'};
  http.Response response = await http.post(
    Uri.parse(_refresh),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(refreshTokenMap),
  );
  SecureStorage storage = SecureStorage();
  if (response.statusCode == 200) {
    Token token = Token.fromJson(json.decode(response.body));
    storage.addTokenToDb(token.token, token.refreshToken);
  } else {
    throw Exception(json.decode(response.body));
  }
}

Future<void> loginApi(User user) async {
  print("fgf[gdfgrefdswscv ggggggggg: ${user.toJson(user)}");
  final http.Response response = await http.post(
    Uri.parse(_login),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.toJson(user)),
  );

  if (response.statusCode == 200) {
    Token token = Token.fromJson(json.decode(response.body));
    SecureStorage storage = SecureStorage();
    storage.addTokenToDb(token.token, token.refreshToken);
  } else {
    throw Exception(json.decode(response.body));
  }
}

Future<List> registrationApi(UserRegistration userRegistration) async {
  final http.Response response = await http.post(
    Uri.parse(_registration),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userRegistration.toDatabaseJson()),
  );
  List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
  return result;
}

// Future<List<dynamic>> clothesApi() async {
//   var asd = await SecureStorage().getUsername();
//   String url = 'http://192.168.254.88:8000/api/clothes/';
//   if (asd != null) {
//     url = url + '?username=' + asd;
//     print('wvgwrew');
//   }
//   http.Response response = await http.get(
//     Uri.parse(url),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );

//   List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
//   return result;
// }
Future<List<dynamic>> clothesListApi() async {
  print('ddddddddddddddddddddddddddddddddd ');
  var token = await SecureStorage().getToken();
  if (token != null) {
    token = 'Bearer ${token}';
  }
  http.Response response = await http.get(
    Uri.parse(_clothAll),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': '${token}',
    },
  );
  if (response.statusCode == 401) {
    refreshToken();
    await Future.delayed(const Duration(seconds: 1));
    return clothesListApi();
  }
  print(token);
  List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
  print(result);
  print('ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd');
  return result;
}
