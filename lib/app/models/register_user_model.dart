import 'dart:convert';

class RegisterUserModel {

  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      name: map['name']?? '',
      email: map['email']?? '',
      password: map['password']?? '',
      confirmPassword: map['password_confirmation']?? '',
    );
  }

  String toJson()=> json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) => RegisterUserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterUserModel{ name: $name, email: $email, password: $password, confirmPassword: $confirmPassword,}';
  }

}