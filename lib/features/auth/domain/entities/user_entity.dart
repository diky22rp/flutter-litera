import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String name;
  final int balance;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    this.balance = 0,
  });

  @override
  List<Object?> get props => [uid, email, name, balance];
}
