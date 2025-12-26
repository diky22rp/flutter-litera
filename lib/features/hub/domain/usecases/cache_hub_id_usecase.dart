import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CacheHubIdUseCase implements UseCase<void, HubEntity> {
  final HubRepository repository;
  CacheHubIdUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(HubEntity hub) async {
    return await repository.cacheHub(hub);
  }
}
