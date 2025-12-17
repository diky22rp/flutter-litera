import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';

abstract class HubRepository {
  Future<Either<Failure, List<HubEntity>>> getAllHubs();

  Future<Either<Failure, void>> cacheHub(HubEntity hub);

  Future<Either<Failure, String?>> getSavedHubID();
  Future<Either<Failure, String?>> getSavedHubName();
}
