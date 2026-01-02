import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_litera/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DocumentSnapshot doc = await firestore
        .collection('users')
        .doc(result.user!.uid)
        .get();

    if (!doc.exists) {
      throw Exception("User data not found in database");
    }

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel newUser = UserModel(
      uid: result.user!.uid,
      email: email,
      name: name,
      role: 'user',
    );

    await firestore.collection('users').doc(newUser.uid).set(newUser.toMap());

    return newUser;
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await firestore
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }
}
