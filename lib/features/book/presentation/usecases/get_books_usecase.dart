import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/book/domain/repositories/book_repository.dart';

class GetBooksUseCase implements UseCase<List<BookEntity>, NoParams> {
  final BookRepository repository;

  GetBooksUseCase(this.repository);

  @override
  Future<Either<Failure, List<BookEntity>>> call(NoParams params) async {
    return await repository.getBooks();
  }
}
