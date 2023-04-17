import 'dart:ffi';

import 'package:appp/models/user_model.dart';
import 'package:appp/api/api_model.dart';

abstract class IHomeRepository {
  Future<void> loginUser(String username, String password);
}