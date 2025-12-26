import 'package:dio/dio.dart';
import 'package:flutter_litera/core/constants/api_constants.dart';
import 'package:flutter_litera/features/book/data/models/book_model.dart';
import 'package:injectable/injectable.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> getBooksFromApi();
}

@LazySingleton(as: BookRemoteDataSource)
class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final Dio dio;

  BookRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BookModel>> getBooksFromApi() async {
    final response = await dio.get(
      ApiConstants.getBooks,
      queryParameters: {'page': 1, 'sort': 'newest', 'limit': 10},
    );

    if (response.statusCode == 200) {
      final List? data = response.data['books'];

      if (data != null) {
        return data
            .map((json) => BookModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      return [];
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Status code: ${response.statusCode}',
      );
    }
  }
}
