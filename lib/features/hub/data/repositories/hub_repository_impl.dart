import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/utils/firebase_error_handler.dart';
import 'package:flutter_litera/features/hub/data/datasources/hub_remote_data_source.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';

class HubRepositoryImpl implements HubRepository {
  final HubRemoteDataSource remoteDataSource;

  HubRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<HubEntity>>> getAllHubs() async {
    try {
      final hubs = await remoteDataSource.getAllHubs();
      return Right(hubs);
    } catch (e) {
      final errorMessage = FirebaseErrorHandler.getMessage(e);
      return Left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<Either<Failure, HubEntity>> getHubById(String id) async {
    return const Left(ServerFailure("Fitur belum tersedia"));
  }
}
