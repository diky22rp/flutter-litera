import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/repositories/book_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetGenresUseCase implements UseCase<List<String>, NoParams> {
  final BookRepository repository;

  GetGenresUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await repository.getGenres();
  }
}
