import 'package:store_app/data/keys/json_keys.dart';

class User {
  final String name;
  final String email;
  final String id;
  const User({required this.name, required this.id, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json[JsonKeys.id];
    final name = json[JsonKeys.name];
    final email = json[JsonKeys.email];
    return User(
      id: id,
      name: name,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      JsonKeys.id: id,
      JsonKeys.name: name,
      JsonKeys.email: email,
    };
  }
}
