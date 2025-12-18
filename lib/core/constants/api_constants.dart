import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';

  // Endpoints
  static String getBooks = '$baseUrl/book';
  static String getRandomBook = '$baseUrl/random_book';
  static String getGenreStats = '$baseUrl/stats/genre';
}
