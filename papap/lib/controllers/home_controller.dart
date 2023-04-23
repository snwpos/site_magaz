import 'package:papap/models/cloth.dart';
import 'package:papap/storage/storage.dart';

import '../api/api_connect.dart';
import '../api/api_models.dart';

class HomeController {
  Future<void> loginUser(String username, String password) async {
    UserLogin userLogin = UserLogin(username: username, password: password);
    await loginApi(userLogin);
    SecureStorage storage = SecureStorage();
    storage.addUsernameToDb(username);
  }

  Future<String> registerUser(
      String username, String email, String password1, String password2) async {
    UserRegistration userRegistration = UserRegistration(
        username: username,
        email: email,
        password1: password1,
        password2: password2);
    dynamic result = await registrationApi(userRegistration);
    String reply = '';
    if (result[0] == 'YES') {
      loginUser(username, password1);
    }
    result.forEach((element) {
      reply = reply + '${element}\n';
    });
    return reply;
  }

  Future<List<Clothes>> getClothes() async {
    List<Clothes> allClothes = [];
    print(allClothes);
    List<dynamic> result = await clothesApi();
    print('FSDFSDFSDF ${result}');
    result.forEach((element) {
      allClothes.add(Clothes(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          type: element['type']));
    });
    return allClothes;
  }
}
