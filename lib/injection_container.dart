import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_litera/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_litera/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_litera/features/home/data/repositories/book_repository_impl.dart';
import 'package:flutter_litera/features/home/domain/repositories/book_repository.dart';
import 'package:flutter_litera/features/home/domain/usecases/get_books_usecase.dart';
import 'package:flutter_litera/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_litera/features/hub/data/datasources/hub_local_data_source.dart';
import 'package:flutter_litera/features/hub/data/datasources/hub_remote_data_source.dart';
import 'package:flutter_litera/features/hub/data/repositories/hub_repository_impl.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:flutter_litera/features/hub/domain/usecases/cache_hub_id_usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_all_hubs_usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_cached_hub_name_usecase.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';
import 'package:flutter_litera/features/main/presentation/cubit/main_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //register FirebaseAuth & Firestore saat masuk fitur Auth

  //Core

  //==Features - Auth
  // Usecase
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
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
      logoutUseCase: sl(),
      registerUseCase: sl(),
      authRepository: sl(),
    ),
  );

  //== External (Firebase, SharedPreferences, Dio)
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());

  //== Features - Hub Selection
  // Usecase
  sl.registerLazySingleton(() => GetAllHubsUseCase(sl()));
  sl.registerLazySingleton(() => CacheHubIdUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedHubNameUseCase(sl()));

  // Repository
  sl.registerLazySingleton<HubRepository>(
    () => HubRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<HubRemoteDataSource>(
    () => HubRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<HubLocalDataSource>(
    () => HubLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerFactory(
    () => HubBloc(
      getAllHubsUseCase: sl(),
      cacheHubIdUseCase: sl(),
      getCachedHubNameUseCase: sl(),
    ),
  );

  //==Features - Home
  // Bloc
  sl.registerFactory(() => HomeBloc(getBooksUseCase: sl()));

  // UseCase
  sl.registerLazySingleton(() => GetBooksUseCase(sl()));

  // Repository
  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: sl()),
  );

  //== Features - Main Navigation dll
  sl.registerFactory(() => MainCubit());
}
