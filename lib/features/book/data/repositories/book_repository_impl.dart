import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart'; // Import Dio
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/book/data/datasources/book_remote_data_source.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/book/domain/repositories/book_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> getBooks({
    String? keyword,
    String? sort,
    int? year,
    String? genre,
    int? page,
    int? limit,
  }) async {
    try {
      final result = await remoteDataSource.getBooks(
        keyword: keyword,
        sort: sort,
        year: year,
        genre: genre,
        page: page,
        limit: limit,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? "Gagal terhubung ke server"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getGenres() async {
    try {
      final result = await remoteDataSource.getGenres();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
