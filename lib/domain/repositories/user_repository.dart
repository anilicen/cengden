import 'package:cengden/domain/entities/User.dart';

abstract class UserRepository {
  registerUser(User user);
  Future<String> sendVerificationCode(String email);
}
