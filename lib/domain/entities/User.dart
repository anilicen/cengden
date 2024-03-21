import 'package:cengden/constants.dart';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phoneNumber;

  final UserType userType;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        email = json['email'],
        password = json['password'],
        name = json['name'],
        phoneNumber = json['phoneNumber'],
        userType = json['userType'];
}
