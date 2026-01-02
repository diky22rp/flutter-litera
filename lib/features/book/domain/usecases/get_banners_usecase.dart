import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/entities/banner_entity.dart';
import 'package:flutter_litera/features/book/domain/repositories/banner_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBannersUseCase implements UseCase<List<BannerEntity>, NoParams> {
  final BannerRepository repository;

  GetBannersUseCase(this.repository);

  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParams params) async {
    return await repository.getBanners();
  }
}
