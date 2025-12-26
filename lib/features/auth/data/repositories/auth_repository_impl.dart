import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/utils/firebase_error_handler.dart';
import 'package:flutter_litera/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_litera/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(email, password);

      return Right(userModel.toEntity());
    } catch (e) {
      final errorMessage = FirebaseErrorHandler.getMessage(e);
      return Left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.register(name, email, password);

      return Right(userModel.toEntity());
    } catch (e) {
      final errorMessage = FirebaseErrorHandler.getMessage(e);
      return Left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return user != null;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      final errorMessage = FirebaseErrorHandler.getMessage(e);
      return Left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final userModel = await remoteDataSource.getCurrentUser();

      if (userModel != null) {
        return Right(userModel.toEntity());
      } else {
        return const Right(null);
      }
    } catch (e) {
      final errorMessage = FirebaseErrorHandler.getMessage(e);

      return Left(ServerFailure(errorMessage));
    }
  }
}
