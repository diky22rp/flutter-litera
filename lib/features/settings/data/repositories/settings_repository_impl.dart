import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:flutter_litera/features/settings/domain/entities/app_setting_entity.dart';
import 'package:flutter_litera/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;
  SettingsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AppSettingEntity>> getSettings() async {
    try {
      final result = await remoteDataSource.getSettings();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateRentalPrice(int newPrice) async {
    try {
      await remoteDataSource.updateRentalPrice(newPrice);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
