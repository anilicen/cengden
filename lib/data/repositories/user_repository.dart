import 'dart:math';

import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/repositories/user_repository.dart';
import 'package:cengden/helpers/request.dart';
import 'package:cengden/helpers/send_mail.dart';

class DataUserRepository implements UserRepository {
  @override
  Future<void> registerUser(User user) async {
    await Request.addUser(user.toJson());
  }

  @override
  Future<User> getUserWithEmail(String email) async {
    User user = await Request.getUserWithEmail(email);
    return user;
  }

  @override
  Future<String> sendVerificationCode(String email) async {
    Random random = Random();
    int value = 1000 + random.nextInt(9000);
    await SendMail.callCloudFunction(email, value.toString());
    return value.toString();
  }

  @override
  Future<void> updateUser(User user) async {
    await Request.updateUser(user);
  }

  @override
  Future<void> updateFavoriteList(User user) async {
    await Request.updateUserFavoriteList(user);
  }

  @override
  Future<void> deleteUser(String email) async {
    await Request.deleteUser(email);
  }
}
