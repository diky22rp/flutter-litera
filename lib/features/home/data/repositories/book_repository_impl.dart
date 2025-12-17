import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_litera/features/home/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/home/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final HomeRemoteDataSource remoteDataSource;

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
