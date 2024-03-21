import 'dart:convert';

import 'package:cengden/constants.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/repositories/user_repository.dart';
import 'package:cengden/navigator.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegistrationController extends Controller {
  RegistrationController(
    UserRepository userRepository,
  ) : _userRepository = userRepository;

  final UserRepository _userRepository;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  User? user;
  String? email;
  String? password;
  String? passwordAgain;
  String? name;
  String? phoneNumber;
  bool? isPasswordsSame;
  bool? isCengEmail;
  bool isEnabled = false;
  bool displayErrors = false;

  void setEmail(String value) {
    email = value;
    areFieldsSet();
    print(email);
    displayErrors = false;
  }

  void setPassword(String value) {
    password = value;
    areFieldsSet();
    displayErrors = false;
  }

  void setPasswordAgain(String value) {
    passwordAgain = value;
    areFieldsSet();
    displayErrors = false;
  }

  void setName(String value) {
    name = value;
    areFieldsSet();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    areFieldsSet();
  }

  bool isPasswordSame() {
    isPasswordsSame = password == passwordAgain;
    return isPasswordsSame!;
  }

  bool isMailCengMail() {
    if (email!.contains('@')) {
      isCengEmail = email!.split('@')[1] == 'ceng.metu.edu.tr';
    } else {
      isCengEmail = false;
    }
    return isCengEmail!;
  }

  void areFieldsSet() {
    if (email != null && password != null && passwordAgain != null && name != null && phoneNumber != null) {
      isEnabled = true;
      refreshUI();
    }
  }

  Future<void> register(BuildContext context) async {
    if (isMailCengMail() && isPasswordSame()) {
      var bytes = utf8.encode(password!);
      var digest = sha1.convert(bytes);

      user = User(
        id: '0',
        email: email!,
        password: digest.toString(),
        name: name!,
        phoneNumber: phoneNumber!,
        userType: UserType.AUTH,
      );

      print(email!);
      String verificationCode = await _userRepository.sendVerificationCode(email!);
      CengdenNavigator.navigateToVerificationView(context, user!, verificationCode);
    } else {
      isPasswordSame();
      displayErrors = true;
      refreshUI();
    }
  }

  void navigateToVerificationView(BuildContext context, User user, String verificationCode) {
    CengdenNavigator.navigateToVerificationView(context, user, verificationCode);
  }
}
