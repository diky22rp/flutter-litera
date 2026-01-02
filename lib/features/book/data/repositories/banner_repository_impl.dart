import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/book/data/datasources/banner_remote_data_source.dart';
import 'package:flutter_litera/features/book/domain/entities/banner_entity.dart';
import 'package:flutter_litera/features/book/domain/repositories/banner_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BannerRepository)
class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;

  BannerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      final result = await remoteDataSource.getBanners();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
