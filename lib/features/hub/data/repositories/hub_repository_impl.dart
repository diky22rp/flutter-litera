import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/utils/firebase_error_handler.dart';
import 'package:flutter_litera/features/hub/data/datasources/hub_local_data_source.dart';
import 'package:flutter_litera/features/hub/data/datasources/hub_remote_data_source.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HubRepository)
class HubRepositoryImpl implements HubRepository {
  final HubRemoteDataSource remoteDataSource;
  final HubLocalDataSource localDataSource;

  HubRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

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
  Future<Either<Failure, void>> cacheHub(HubEntity hub) async {
    try {
      await localDataSource.cacheHubData(hub.id, hub.name);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure("Gagal menyimpan data lokasi"));
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedHubID() async {
    try {
      final id = await localDataSource.getCachedHubId();
      return Right(id);
    } catch (e) {
      return const Left(CacheFailure("Gagal mengambil ID lokasi"));
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedHubName() async {
    try {
      final name = await localDataSource.getCachedHubName();
      return Right(name);
    } catch (e) {
      return const Left(CacheFailure("Gagal mengambil nama lokasi"));
    }
  }
}
