import 'dart:convert';

import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/repositories/user_repository.dart';
import 'package:cengden/navigator.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginController extends Controller {
  LoginController(UserRepository userRepository) : _userRepository = userRepository;

  final UserRepository _userRepository;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  String? email;
  String? password;
  bool isNotFound = false;
  bool arePasswordsMatch = true;
  User? user;

  Future<void> getUserWithEmail() async {
    user = await _userRepository.getUserWithEmail(email!);
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  bool checkPasswords() {
    if (user!.email == "NOT FOUND") {
      isNotFound = true;
      return false;
    } else {
      var bytes = utf8.encode(password!);
      var digest = sha1.convert(bytes);

      arePasswordsMatch = digest.toString() == user!.password;

      return arePasswordsMatch;
    }
  }

  Future<void> login(BuildContext context) async {
    await getUserWithEmail();

    if (checkPasswords() && email != null && password != null) {
      CengdenNavigator.navigateToMainView(context, user!);
    } else {
      refreshUI();
    }
  }
}
