import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/pages/main_page/main_view.dart';
import 'package:cengden/pages/registration_page/registration_view.dart';
import 'package:cengden/pages/verification_page/verification_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CengdenNavigator {
  static Future<void> navigateToMainView(BuildContext context, User user) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => MainView(user)),
    );
  }

  static Future<void> navigateToRegistrationView(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => RegistrationView()),
    );
  }

  static Future<void> navigateToVerificationView(BuildContext context, User user, String verificationCode) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => VerificationView(user, verificationCode)),
    );
  }
}
