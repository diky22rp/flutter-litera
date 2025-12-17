import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_litera/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_litera/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/register_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //register FirebaseAuth & Firestore saat masuk fitur Auth

  //Core

  //Features - Auth
  // Usecase
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: sl(), firestore: sl()),
  );

  // External (Firebase)
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
