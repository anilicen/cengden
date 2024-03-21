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

  Future<String> sendVerificationCode(String email) async {
    Random random = Random();
    int value = 1000 + random.nextInt(9000);
    await SendMail.callCloudFunction(email, value.toString());
    return value.toString();
  }
}
