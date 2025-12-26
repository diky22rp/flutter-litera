import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSavedHubIdUseCase implements UseCase<String?, NoParams> {
  final HubRepository repository;

  GetSavedHubIdUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    // Pastikan di repository method-nya namanya 'getSavedHubID'
    return await repository.getSavedHubID();
  }
}
