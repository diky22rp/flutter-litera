import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdatePriceUseCase implements UseCase<void, int> {
  final SettingsRepository repository;
  UpdatePriceUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int newPrice) async {
    return await repository.updateRentalPrice(newPrice);
  }
}
