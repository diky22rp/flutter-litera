import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String id;
  final String title;
  final String author;
  final String summary;
  final String coverUrl;
  final double rating;
  final int price;

  const BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.coverUrl,
    required this.rating,
    required this.price,
  });

  @override
  List<Object> get props => [
    id,
    title,
    author,
    summary,
    coverUrl,
    rating,
    price,
  ];
}
