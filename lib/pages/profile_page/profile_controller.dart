import 'dart:convert';

import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/repositories/user_repository.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfileController extends Controller {
  ProfileController(
    UserRepository userRepository,
    User user,
  )   : _userRepository = userRepository,
        user = user;

  UserRepository _userRepository;
  User user;

  String? oldPassword;
  String? newPassword;
  String? toBeDeletedUser;
  bool isError = false;

  int isUpdating = 0;

  void switchToUpdating() {
    isUpdating = 1;
    refreshUI();
  }

  void switchToChangePassword() {
    isUpdating = 2;
    refreshUI();
  }

  void setUserEmail(String val) {
    toBeDeletedUser = val;
  }

  void deleteUser() {
    _userRepository.deleteUser(toBeDeletedUser!);
  }

  void updateName(String val) {
    user = user.copyWith(name: val);
  }

  void updatePhoneNumber(String val) {
    user = user.copyWith(phoneNumber: val);
  }

  void setOldPassword(String val) {
    oldPassword = val;
    isError = false;
  }

  void setNewPassword(String val) {
    newPassword = val;
    isError = false;
  }

  bool checkPassword() {
    var bytes = utf8.encode(oldPassword!);
    var digest = sha1.convert(bytes);

    return digest.toString() == user.password;
  }

  Future<void> updateUser() async {
    await _userRepository.updateUser(user);
    isUpdating = 0;
    refreshUI();
  }

  Future<void> updatePassword() async {
    if (checkPassword()) {
      var bytes = utf8.encode(newPassword!);
      var digest = sha1.convert(bytes);
      user = user.copyWith(password: digest.toString());
      await _userRepository.updateUser(user);
      isUpdating = 0;
    } else {
      isError = true;
    }
    refreshUI();
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
