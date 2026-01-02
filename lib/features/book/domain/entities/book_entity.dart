import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String id;
  final String title;
  final String category;
  final String author;
  final String publisher;
  final String summary;
  final String coverUrl;
  final double rating;
  final int price;
  final String buyUrl;

  const BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.category,
    required this.summary,
    required this.coverUrl,
    required this.rating,
    required this.price,
    required this.buyUrl,
  });

  @override
  List<Object> get props => [
    id,
    title,
    author,
    publisher,
    category,
    summary,
    coverUrl,
    rating,
    price,
    buyUrl,
  ];
}
