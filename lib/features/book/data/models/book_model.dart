import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.publisher,
    required super.category,
    required super.summary,
    required super.coverUrl,
    required super.rating,
    required super.price,
    required super.buyUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id'] ?? '',

      title: json['title'] ?? 'Tanpa Judul',

      author: (json['author'] is Map<String, dynamic>)
          ? json['author']['name'] ?? 'Unknown Author'
          : 'Unknown Author',

      publisher: json['publisher'] ?? 'Unknown Publisher',

      category: (json['category'] is Map<String, dynamic>)
          ? json['category']['name'] ?? 'Unknown Category'
          : 'Unknown Category',

      summary: json['summary'] ?? 'Tidak ada ringkasan.',

      coverUrl: json['cover_image'] ?? 'https://via.placeholder.com/150',

      rating: 4.5,

      price: _parsePrice(json['details']),

      buyUrl:
          (json['buy_links'] is List && (json['buy_links'] as List).isNotEmpty)
          ? json['buy_links'][0]['url']
          : null,
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
