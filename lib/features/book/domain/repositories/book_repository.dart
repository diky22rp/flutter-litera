import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookEntity>>> getBooks({
    String? keyword,
    String? sort,
    int? year,
    String? genre,
    int? page,
    int? limit,
  });

  Future<Either<Failure, List<String>>> getGenres();
}
