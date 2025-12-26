import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCachedHubNameUseCase implements UseCase<String?, NoParams> {
  final HubRepository repository;

  GetCachedHubNameUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await repository.getSavedHubName();
  }
}
