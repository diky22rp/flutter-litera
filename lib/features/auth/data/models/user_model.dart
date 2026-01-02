import 'package:flutter_litera/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String role;

  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      role: map['role'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name, 'role': role};
  }

  UserEntity toEntity() {
    return UserEntity(uid: uid, email: email, name: name, role: role);
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      name: entity.name,
      role: entity.role,
    );
  }
}
