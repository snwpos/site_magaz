import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:appp/models/storage_item.dart';
import '../api/api_model.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();

  Future<void> addTokenToDb(token, refresh_token) async {
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'refresh_token', value: refresh_token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

  Future<void> addUsernameToDb(username) async {
    await storage.write(key: 'username', value: username);
  }

  Future<String?> getUsername() async {
    return await storage.read(key: 'username');
  }

  Future<void> deleteData() async {
    storage.deleteAll();
  }
}