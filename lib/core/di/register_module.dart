import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  //firebase
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  //firestore
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  //Shared Preferences (need await / preResolve)
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  //dio
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
