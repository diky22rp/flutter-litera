import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/settings/domain/entities/app_setting_entity.dart';
import 'package:flutter_litera/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSettingsUseCase implements UseCase<AppSettingEntity, NoParams> {
  final SettingsRepository repository;
  GetSettingsUseCase(this.repository);

  @override
  Future<Either<Failure, AppSettingEntity>> call(NoParams params) async {
    return await repository.getSettings();
  }
}
