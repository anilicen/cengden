import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/repositories/user_repository.dart';
import 'package:cengden/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class VerificationController extends Controller {
  VerificationController(
    UserRepository userRepository,
    User user,
    String verificationCode,
  )   : _userRepository = userRepository,
        user = user,
        verificationCode = verificationCode;

  User user;
  String verificationCode;
  String? usersVerificationCode;
  final UserRepository _userRepository;
  bool isEnabled = false;
  bool? isError = false;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void setVerificationCode(String value) {
    usersVerificationCode = value;
    if (usersVerificationCode!.length == 4) {
      isEnabled = true;
    } else {
      isEnabled = false;
    }
    refreshUI();
  }

  bool checkVerificationCode() {
    return usersVerificationCode == verificationCode;
  }

  Future<void> verify(BuildContext context) async {
    if (checkVerificationCode()) {
      await _userRepository.registerUser(user);
      CengdenNavigator.navigateToMainView(context, user);
    } else {
      isError = true;
      refreshUI();
    }
  }
}
