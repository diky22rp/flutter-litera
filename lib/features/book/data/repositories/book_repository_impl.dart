import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  Future<Either<Failure, List<BookEntity>>> getBooks() async {
    try {
      final result = await remoteDataSource.getBooksFromApi();

      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure("Masalah Koneksi: ${e.message}"));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
