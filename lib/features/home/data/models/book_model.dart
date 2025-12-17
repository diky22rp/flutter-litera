import 'package:flutter_litera/features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.summary,
    required super.coverUrl,
    required super.rating,
    required super.price,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id'] ?? '',

      title: json['title'] ?? 'Tanpa Judul',

      author: (json['author'] is Map<String, dynamic>)
          ? json['author']['name'] ?? 'Unknown Author'
          : 'Unknown Author',

      summary: json['summary'] ?? 'Tidak ada ringkasan.',

      coverUrl: json['cover_image'] ?? 'https://via.placeholder.com/150',

      rating: 4.5,

      price: _parsePrice(json['details']),
    );
  }

  static int _parsePrice(dynamic details) {
    try {
      if (details is Map<String, dynamic>) {
        String priceString = details['price'] ?? '0';
        String cleanPrice = priceString.replaceAll(RegExp(r'[^0-9]'), '');
        return int.parse(cleanPrice);
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }
}
