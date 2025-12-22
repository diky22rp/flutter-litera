import 'package:flutter_litera/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final int balance;

  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.balance,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      balance: (map['balance'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name, 'balance': balance};
  }

  UserEntity toEntity() {
    return UserEntity(uid: uid, email: email, name: name, balance: balance);
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      name: entity.name,
      balance: entity.balance,
    );
  }
}
