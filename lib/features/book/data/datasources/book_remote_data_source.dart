import 'package:dio/dio.dart';
import 'package:flutter_litera/core/constants/api_constants.dart';
import 'package:flutter_litera/features/book/data/models/book_model.dart';
import 'package:injectable/injectable.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> getBooks({
    String? keyword,
    String? sort,
    int? year,
    String? genre,
    int? page = 1,
    int? limit,
  });

  Future<List<String>> getGenres();
}

@LazySingleton(as: BookRemoteDataSource)
class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final Dio dio;

  BookRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BookModel>> getBooks({
    String? keyword,
    String? sort,
    int? year,
    String? genre,
    int? page = 1,
    int? limit,
  }) async {
    final Map<String, dynamic> queryParams = {'page': page ?? 1};

    if (keyword != null && keyword.isNotEmpty) queryParams['keyword'] = keyword;
    if (sort != null && sort.isNotEmpty) queryParams['sort'] = sort;
    if (year != null) queryParams['year'] = year;
    if (genre != null && genre.isNotEmpty) queryParams['genre'] = genre;
    if (limit != null) queryParams['limit'] = limit;

    final response = await dio.get(
      ApiConstants.getBooks,
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      final List? data = response.data['data'] ?? response.data['books'];

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

  @override
  Future<List<String>> getGenres() async {
    try {
      final response = await dio.get('${ApiConstants.baseUrl}/stats/genre');

      if (response.statusCode == 200) {
        final List? rawList = response.data['genre_statistics'];

        if (rawList != null) {
          final List<String> genres = rawList
              .map((item) => item['genre'] as String?)
              .where((g) => g != null)
              .map((g) => g!.replaceAll(RegExp(r'[,\s]+$'), ''))
              .toSet()
              .toList();

          genres.sort();

          return genres;
        }

        return [];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      return [];
    }
  }
}
