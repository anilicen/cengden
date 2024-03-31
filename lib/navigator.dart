import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/pages/add_item_page/add_item_view.dart';
import 'package:cengden/pages/detail_page/item_details_view.dart';
import 'package:cengden/pages/login_page/login_view.dart';
import 'package:cengden/pages/main_page/main_view.dart';
import 'package:cengden/pages/profile_page/profile_view.dart';
import 'package:cengden/pages/registration_page/registration_view.dart';
import 'package:cengden/pages/update_item_page/update_item_view.dart';
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

  static Future<void> navigateToItemDetailsView(BuildContext context, Item item, User user) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => ItemDetailsView(item, user)),
    );
  }

  static Future<void> navigateToLoginView(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => LoginView()),
    );
  }

  static Future<void> navigateToAddItemView(BuildContext context, User user) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => AddItemView(user)),
    );
  }

  static Future<void> navigateToUpdateItemView(BuildContext context, User user, Item item) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => UpdateItemView(user, item)),
    );
  }

  static Future<void> navigateToProfileView(BuildContext context, User user) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => ProfileView(user)),
    );
  }

  static Future<void> navigateToVerificationView(BuildContext context, User user, String verificationCode) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => VerificationView(user, verificationCode)),
    );
  }
}
