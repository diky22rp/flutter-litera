import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';

class GetAllHubsUseCase implements UseCase<List<HubEntity>, NoParams> {
  final HubRepository repository;

  GetAllHubsUseCase(this.repository);

  @override
  Future<Either<Failure, List<HubEntity>>> call(NoParams params) async {
    return await repository.getAllHubs();
  }
}
