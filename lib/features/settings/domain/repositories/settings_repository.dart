import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/settings/domain/entities/app_setting_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, AppSettingEntity>> getSettings();
  Future<Either<Failure, void>> updateRentalPrice(int newPrice);
}
