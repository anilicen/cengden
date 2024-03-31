import 'package:cengden/constants.dart';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final UserType userType;
  final List<String> favoriteItemList;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.userType,
    required this.favoriteItemList,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
      'userType': userType.toString(),
      'favoriteItemList': favoriteItemList == [] ? "" : favoriteItemList.join(', '),
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? '0',
        email = json['email'],
        password = json['password'],
        name = json['name'],
        phoneNumber = json['phoneNumber'],
        userType = _getUserTypeFromString(json['userType']),
        favoriteItemList = json['favoriteItemList'] == "" ? [] : json['favoriteItemList'].split(', ');

  static UserType _getUserTypeFromString(String userTypeString) {
    switch (userTypeString) {
      case 'UserType.REGULAR':
        return UserType.REGULAR;
      case 'UserType.AUTH':
        return UserType.AUTH;
      case 'UserType.ADMIN':
        return UserType.ADMIN;
      default:
        throw ArgumentError('Invalid user type: $userTypeString');
    }
  }

  User copyWith({String? name, String? phoneNumber, String? password}) {
    return User(
      id: id,
      email: email,
      password: password ?? this.password,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userType: userType,
      favoriteItemList: favoriteItemList,
    );
  }
}
