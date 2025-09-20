import 'package:flutteranimationdemo/utils/FileReader.dart';

class User {
  final String name;
  final String email;
  final String profilePicture;

  User({
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      profilePicture: json['profile_picture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profile_picture': profilePicture,
    };
  }

  static Future<User> getSampleUser() async {
    FileReader fileReader = FileReader('assets/user.json');
    return await fileReader.getUser();
  }
}

