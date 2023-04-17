import 'package:appp/models/user_model.dart';
import 'package:appp/api/api_model.dart';

abstract class IUserRepository {
  Future<List<User>> getAll();

  Future<User?> getOne(int id);

  Future<bool> register(String email, String username, String password);

  Future<String> login(String username, String password);

  Future<void> update(User user);

  Future<void> delete(int id);
}