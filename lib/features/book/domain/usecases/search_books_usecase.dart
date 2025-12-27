import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/book/domain/repositories/book_repository.dart';
import 'package:injectable/injectable.dart';

class FilterBookParams {
  final String? keyword;
  final String? sort;
  final int? year;
  final String? genre;
  final int page;

  FilterBookParams({
    this.keyword,
    this.sort,
    this.year,
    this.genre,
    this.page = 1,
  });
}

@lazySingleton
class SearchBooksUseCase
    implements UseCase<List<BookEntity>, FilterBookParams> {
  final BookRepository repository;

  SearchBooksUseCase(this.repository);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
    FilterBookParams params,
  ) async {
    return await repository.getBooks(
      keyword: params.keyword,
      sort: params.sort,
      year: params.year,
      genre: params.genre,
      page: params.page,
      limit: 10,
    );
  }
}
