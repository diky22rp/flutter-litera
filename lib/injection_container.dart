import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_litera/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_litera/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/hub/data/datasources/hub_remote_data_source.dart';
import 'package:flutter_litera/features/hub/data/repositories/hub_repository_impl.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_all_hubs_usecase.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //register FirebaseAuth & Firestore saat masuk fitur Auth

  //Core

  //==Features - Auth
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

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      authRepository: sl(),
    ),
  );

  //== External (Firebase)
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  //== Features - Hub Selection
  // Usecase
  sl.registerLazySingleton(() => GetAllHubsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<HubRepository>(
    () => HubRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<HubRemoteDataSource>(
    () => HubRemoteDataSourceImpl(firestore: sl()),
  );

  sl.registerFactory(() => HubBloc(getAllHubsUseCase: sl()));
}
