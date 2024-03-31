import 'package:cengden/domain/entities/User.dart';

abstract class UserRepository {
  registerUser(User user);
  Future<String> sendVerificationCode(String email);
  Future<User> getUserWithEmail(String email);
  Future<void> updateUser(User user);
  Future<void> updateFavoriteList(User user);
  Future<void> deleteUser(String email);
}
