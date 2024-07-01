import 'dart:convert';

class UserModel {
  final String username;
  final String fullName;
  final String email;
  final int birthYear;
  final String password;

  UserModel({
    required this.username,
    required this.fullName,
    required this.email,
    required this.birthYear,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      fullName: json['fullName'],
      email: json['email'],
      birthYear: json['birthYear'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'fullName': fullName,
      'email': email,
      'birthYear': birthYear,
      'password': password,
    };
  }

  factory UserModel.fromString(String userString) {
    return UserModel.fromJson(json.decode(userString));
  }

  String toStringJson() {
    return json.encode(toJson());
  }
}
