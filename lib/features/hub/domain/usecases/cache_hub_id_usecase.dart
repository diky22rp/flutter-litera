import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';

class CacheHubIdUseCase implements UseCase<void, String> {
  final HubRepository repository;
  CacheHubIdUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String hubId) async {
    return await repository.cacheHubID(hubId);
  }
}
